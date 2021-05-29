import 'package:flutter/material.dart';
import 'helpers/colors_helper.dart';
import 'helpers/router_helper.dart';
import 'helpers/text_helper.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: C.white,
        buttonTheme: const ButtonThemeData(
          alignedDropdown: true,
          padding: EdgeInsets.all(8),
          minWidth: 12,
        ),
        primaryColor: C.primary,
        accentColor: C.accent,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 24,
            letterSpacing: 0.15,
            fontWeight: TextHelper.bold,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: TextHelper.regular,
            color: C.grey_500,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: TextHelper.regular,
            color: C.grey_500,
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: TextHelper.regular,
            color: C.danger,
          ),
        ),
      ),
      onGenerateTitle: (BuildContext context) => "Flutter Challenge",
      onGenerateRoute: (route) => R.generateRoute(route),
      initialRoute: R.homePage,
    );
  }
}
