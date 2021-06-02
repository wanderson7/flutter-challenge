import 'package:flutter_challenge/app/api/dio/custom_dio.dart';
import 'package:flutter_challenge/app/shared/model/form/user_form.dart';
import 'package:flutter_challenge/app/shared/model/session/session_model.dart';

class SessionRepository {
  Future<SessionModel> onSignUpAsync(UserForm form) async {
    final dio = await CustomDio().init();
    final response = await dio.post(
      'users',
      data: form.toJson(),
    );
    return SessionModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<SessionModel> onSignInAsync(
    String? email,
    String? password,
  ) async {
    final dio = await CustomDio().init();
    final response = await dio.post(
      'users/token',
      data: {
        'email': email,
        'password': password,
      },
    );
    return SessionModel.fromJson(response.data as Map<String, dynamic>);
  }
}
