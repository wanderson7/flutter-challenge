import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/shared/change_notifier/user_changer.dart';
import 'package:flutter_challenge/app/shared/model/user/user_model.dart';
import 'package:flutter_challenge/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'helpers/colors_helper.dart';
import 'helpers/constants.dart';
import 'helpers/router_helper.dart';
import 'helpers/text_helper.dart';
import 'shared/change_notifier/session_changer.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Map<String, dynamic>>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserChanger>(
          create: (_) => UserChanger(provider[K.userModel] as UserModel?),
        ),
        ChangeNotifierProvider<SessionChanger>(
          create: (_) =>
              SessionChanger(isUserIsLogged: provider[K.userIsLogged] as bool),
        ),
      ],
      child: ChildMaterialApp(),
    );
  }
}

class ChildMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: C.primary,
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
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.white,
        hintColor: Colors.white,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
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
            color: C.white,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: TextHelper.regular,
            color: C.white,
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: TextHelper.regular,
            color: C.danger,
          ),
        ),
      ),
      localizationsDelegates: _buildLocalizationsDelegates(),
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
      onGenerateRoute: (route) => R.generateRoute(
        route,
        isUserLogged: session.isUserLogged(),
      ),
      initialRoute: R.homePage,
    );
  }

  List<LocalizationsDelegate> _buildLocalizationsDelegates() {
    return [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      S.delegate
    ];
  }
}
