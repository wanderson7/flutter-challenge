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

  /// `Confirma????o de Senha`
  String get passwordConfirmation {
    return Intl.message(
      'Confirma????o de Senha',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `N??o tem uma conta? `
  String get doNotYouHaveAnAccount {
    return Intl.message(
      'N??o tem uma conta? ',
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

  /// `Receber atualiza????es por e-mail`
  String get receiveEmailUpdates {
    return Intl.message(
      'Receber atualiza????es por e-mail',
      name: 'receiveEmailUpdates',
      desc: '',
      args: [],
    );
  }

  /// `J?? possui uma conta? `
  String get doYouAlreadyHaveAnAccount {
    return Intl.message(
      'J?? possui uma conta? ',
      name: 'doYouAlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Ol??,`
  String get hello {
    return Intl.message(
      'Ol??,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Voc?? foi logado com sucesso!`
  String get sessionSuccessDescription {
    return Intl.message(
      'Voc?? foi logado com sucesso!',
      name: 'sessionSuccessDescription',
      desc: '',
      args: [],
    );
  }

  /// `Usu??rio`
  String get user {
    return Intl.message(
      'Usu??rio',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Aten????o`
  String get headsUp {
    return Intl.message(
      'Aten????o',
      name: 'headsUp',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Campo obrigat??rio`
  String get requiredField {
    return Intl.message(
      'Campo obrigat??rio',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Nome e sobrenome s??o necess??rios`
  String get requiredFieldValidFullName {
    return Intl.message(
      'Nome e sobrenome s??o necess??rios',
      name: 'requiredFieldValidFullName',
      desc: '',
      args: [],
    );
  }

  /// `Informe um e-mail v??lido`
  String get requiredFieldValidEmail {
    return Intl.message(
      'Informe um e-mail v??lido',
      name: 'requiredFieldValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `M??nimo 8 caracteres, ao menos uma letra mai??scula e um n??mero`
  String get requiredFieldValidPassword {
    return Intl.message(
      'M??nimo 8 caracteres, ao menos uma letra mai??scula e um n??mero',
      name: 'requiredFieldValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Informe um CPF v??lido`
  String get requiredFieldValidCPF {
    return Intl.message(
      'Informe um CPF v??lido',
      name: 'requiredFieldValidCPF',
      desc: '',
      args: [],
    );
  }

  /// `Informe um celular v??lido com 11 d??gitos, contando com o DDD`
  String get requiredFieldValidPhoneNumber {
    return Intl.message(
      'Informe um celular v??lido com 11 d??gitos, contando com o DDD',
      name: 'requiredFieldValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `A confirma????o de senha deve ser igual ?? senha inserida`
  String get requiredFieldConfirmPassword {
    return Intl.message(
      'A confirma????o de senha deve ser igual ?? senha inserida',
      name: 'requiredFieldConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verifique sua conex??o e tente novamente.`
  String get checkConnectionInternet {
    return Intl.message(
      'Verifique sua conex??o e tente novamente.',
      name: 'checkConnectionInternet',
      desc: '',
      args: [],
    );
  }

  /// `Ocorreu um erro, {operation} com tempo limite excedido de conex??o`
  String errorConnectTimeout(Object operation) {
    return Intl.message(
      'Ocorreu um erro, $operation com tempo limite excedido de conex??o',
      name: 'errorConnectTimeout',
      desc: '',
      args: [operation],
    );
  }

  /// `Ocorreu um erro, {operation} com tempo limite excedido de resposta`
  String errorReceiveTimeout(Object operation) {
    return Intl.message(
      'Ocorreu um erro, $operation com tempo limite excedido de resposta',
      name: 'errorReceiveTimeout',
      desc: '',
      args: [operation],
    );
  }

  /// `Ocorreu um erro, {operation} com tempo limite excedido de envio`
  String errorSendTimeout(Object operation) {
    return Intl.message(
      'Ocorreu um erro, $operation com tempo limite excedido de envio',
      name: 'errorSendTimeout',
      desc: '',
      args: [operation],
    );
  }

  /// `Ocorreu um erro ao efetuar o {operation}. Erro interno`
  String errorInternalServerError(Object operation) {
    return Intl.message(
      'Ocorreu um erro ao efetuar o $operation. Erro interno',
      name: 'errorInternalServerError',
      desc: '',
      args: [operation],
    );
  }

  /// `Ocorreu um erro ao efetuar o {operation}. Requisa????o n??o encontrada`
  String errorNotFound(Object operation) {
    return Intl.message(
      'Ocorreu um erro ao efetuar o $operation. Requisa????o n??o encontrada',
      name: 'errorNotFound',
      desc: '',
      args: [operation],
    );
  }

  /// `Ocorreu um erro ao efetuar o {operation}. Verifique sua conex??o e tente novamente.`
  String errorConnectionInternet(Object operation) {
    return Intl.message(
      'Ocorreu um erro ao efetuar o $operation. Verifique sua conex??o e tente novamente.',
      name: 'errorConnectionInternet',
      desc: '',
      args: [operation],
    );
  }

  /// `Ocorreu um erro, {operation} cancelado`
  String errorCancel(Object operation) {
    return Intl.message(
      'Ocorreu um erro, $operation cancelado',
      name: 'errorCancel',
      desc: '',
      args: [operation],
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
