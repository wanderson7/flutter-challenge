import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/page/session/sign_in/sign_in_page.dart';
import 'package:flutter_challenge/app/page/session/sign_up/sign_up_page.dart';

class R {
  static const homePage = '/';
  static const signUpPage = '/sign-up-page';

  static Route<dynamic> generateRoute(
    RouteSettings settings, {
    bool? isUserLogged,
  }) {
    switch (settings.name) {
      case homePage:
        return CupertinoPageRoute(
          settings: const RouteSettings(name: homePage),
          builder: (_) => SignInPage(),
        );
      case signUpPage:
        return CupertinoPageRoute(
          settings: const RouteSettings(name: signUpPage),
          builder: (_) => SignUpPage(),
        );
      default:
        return _getNoRouteDefined(settings);
    }
  }

  static CupertinoPageRoute _getNoRouteDefined(RouteSettings settings) {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
