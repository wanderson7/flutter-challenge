import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/page/home/home_page.dart';

class R {
  static const homePage = '/';
  static const userDetailsPage = '/user-details-page';

  static Route<dynamic> generateRoute(
    RouteSettings settings, {
    bool isUserLogged,
  }) {
    switch (settings.name) {
      case homePage:
        return CupertinoPageRoute(
          settings: const RouteSettings(name: homePage),
          builder: (_) => HomePage(),
        );
      default:
        return _getNoRouteDefined(settings);
        break;
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
