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
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: C.grey),
          hintStyle: TextStyle(color: Colors.white),
          errorStyle: TextStyle(color: C.danger),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: C.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: C.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: C.white),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: C.danger),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: C.danger),
          ),
        ),
        primaryColor: C.primary,
        accentColor: C.accent,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: C.accent,
        ),
        hintColor: Colors.white,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
           headline4: TextStyle(
            fontSize: 32,
            letterSpacing: 0.15,
            color: C.white,
            fontWeight: TextHelper.bold,
          ),
          headline6: TextStyle(
            fontSize: 24,
            letterSpacing: 0.15,
            color: C.grey,
            fontWeight: TextHelper.regular,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: TextHelper.regular,
            color: C.grey,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: TextHelper.regular,
            color: C.grey,
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
