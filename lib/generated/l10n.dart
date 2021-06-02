// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Challenge`
  String get appTitle {
    return Intl.message(
      'Flutter Challenge',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue com o seu`
  String get continueWithYour {
    return Intl.message(
      'Continue com o seu',
      name: 'continueWithYour',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Senha`
  String get password {
    return Intl.message(
      'Senha',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirmação de Senha`
  String get passwordConfirmation {
    return Intl.message(
      'Confirmação de Senha',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Não tem uma conta? `
  String get doNotYouHaveAnAccount {
    return Intl.message(
      'Não tem uma conta? ',
      name: 'doNotYouHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Registre-se`
  String get registerYourself {
    return Intl.message(
      'Registre-se',
      name: 'registerYourself',
      desc: '',
      args: [],
    );
  }

  /// `Registro`
  String get register {
    return Intl.message(
      'Registro',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Registrar`
  String get signUp {
    return Intl.message(
      'Registrar',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Esqueceu sua senha?`
  String get forgotYourPassword {
    return Intl.message(
      'Esqueceu sua senha?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Nome Completo`
  String get fullName {
    return Intl.message(
      'Nome Completo',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `CPF`
  String get cpf {
    return Intl.message(
      'CPF',
      name: 'cpf',
      desc: '',
      args: [],
    );
  }

  /// `Celular`
  String get phone {
    return Intl.message(
      'Celular',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Receber atualizações por e-mail`
  String get receiveEmailUpdates {
    return Intl.message(
      'Receber atualizações por e-mail',
      name: 'receiveEmailUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Já possui uma conta? `
  String get doYouAlreadyHaveAnAccount {
    return Intl.message(
      'Já possui uma conta? ',
      name: 'doYouAlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}