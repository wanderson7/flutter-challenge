import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/page/session/sign_in/sign_in_page.dart';
import 'package:flutter_challenge/app/shared/change_notifier/user_changer.dart';
import 'package:flutter_challenge/app/shared/model/session/session_model.dart';
import 'package:flutter_challenge/app/shared/model/user/user_model.dart';
import 'package:flutter_challenge/config/main_common.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _token = 'shared-preference-token';
  static const _user = 'shared-preference-user';

  static Future saveUserFromSessionSharedPrefence(
    BuildContext context,
    SessionModel? session,
  ) async {
    final UserChanger userChanger = Provider.of<UserChanger>(context, listen: false);
    userChanger.setUserChanger(session?.user);
    await _save(_user, session?.user);
    if (session?.token != null) await _save(_token, session?.token);
  }

  static Future<UserModel?> getUser() async {
    final userJson = await _fetch<String?>(_user);
    try {
      final userMap = jsonDecode(userJson ?? '');
      return UserModel.fromJson(userMap as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  static Future logout(BuildContext context) async {
    _removeAllValues();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => SignInPage()),
      (Route<dynamic> route) => false,
    );
  }

  static Future _removeAllValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
    await prefs.remove(_user);
  }

  static Future<void> _save<T>(String key, T? content) async {
    if (content != null) {
      final preferences = await SharedPreferences.getInstance();

      if (content is String) {
        preferences.setString(key, content);
      }
      if (content is bool) {
        preferences.setBool(key, content);
      }
      if (content is int) {
        preferences.setInt(key, content);
      }
      if (content is double) {
        preferences.setDouble(key, content);
      }
      if (content is List<String>) {
        preferences.setStringList(key, content);
      }
      if (content is UserModel) {
        preferences.setString(key, jsonEncode(content.toJson()));
      }
    }

    logger.v(
      '(TRACE) SharedPreferencesHelper:_save. [key: $key] [value: $content]',
    );
  }

  static Future<T?> _fetch<T>(String key) async {
    final preferences = await SharedPreferences.getInstance();

    final value = preferences.get(key);

    logger.v(
      '(TRACE) SharedPreferencesHelper:_fetch. [key: $key] [value: $value]',
    );

    return value as T?;
  }
}
