// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt_BR';

  static String m0(operation) => "Ocorreu um erro, ${operation} cancelado";

  static String m1(operation) =>
      "Ocorreu um erro, ${operation} com tempo limite excedido de conexão";

  static String m2(operation) =>
      "Ocorreu um erro ao efetuar o ${operation}. Verifique sua conexão e tente novamente.";

  static String m3(operation) =>
      "Ocorreu um erro ao efetuar o ${operation}. Erro interno";

  static String m4(operation) =>
      "Ocorreu um erro ao efetuar o ${operation}. Requisação não encontrada";

  static String m5(operation) =>
      "Ocorreu um erro, ${operation} com tempo limite excedido de resposta";

  static String m6(operation) =>
      "Ocorreu um erro, ${operation} com tempo limite excedido de envio";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("Flutter Challenge"),
        "checkConnectionInternet": MessageLookupByLibrary.simpleMessage(
            "Verifique sua conexão e tente novamente."),
        "continueWithYour":
            MessageLookupByLibrary.simpleMessage("Continue com o seu"),
        "cpf": MessageLookupByLibrary.simpleMessage("CPF"),
        "doNotYouHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Não tem uma conta? "),
        "doYouAlreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Já possui uma conta? "),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "errorCancel": m0,
        "errorConnectTimeout": m1,
        "errorConnectionInternet": m2,
        "errorInternalServerError": m3,
        "errorNotFound": m4,
        "errorReceiveTimeout": m5,
        "errorSendTimeout": m6,
        "forgotYourPassword":
            MessageLookupByLibrary.simpleMessage("Esqueceu sua senha?"),
        "fullName": MessageLookupByLibrary.simpleMessage("Nome Completo"),
        "headsUp": MessageLookupByLibrary.simpleMessage("Atenção"),
        "hello": MessageLookupByLibrary.simpleMessage("Olá,"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "passwordConfirmation":
            MessageLookupByLibrary.simpleMessage("Confirmação de Senha"),
        "phone": MessageLookupByLibrary.simpleMessage("Celular"),
        "receiveEmailUpdates": MessageLookupByLibrary.simpleMessage(
            "Receber atualizações por e-mail"),
        "register": MessageLookupByLibrary.simpleMessage("Registro"),
        "registerYourself": MessageLookupByLibrary.simpleMessage("Registre-se"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("Campo obrigatório"),
        "requiredFieldConfirmPassword": MessageLookupByLibrary.simpleMessage(
            "A confirmação de senha deve ser igual à senha inserida"),
        "requiredFieldValidCPF":
            MessageLookupByLibrary.simpleMessage("Informe um CPF válido"),
        "requiredFieldValidEmail":
            MessageLookupByLibrary.simpleMessage("Informe um e-mail válido"),
        "requiredFieldValidFullName": MessageLookupByLibrary.simpleMessage(
            "Nome e sobrenome são necessários"),
        "requiredFieldValidPassword": MessageLookupByLibrary.simpleMessage(
            "Mínimo 8 caracteres, ao menos uma letra maiúscula e um número"),
        "requiredFieldValidPhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Informe um celular válido com 11 dígitos, contando com o DDD"),
        "sessionSuccessDescription": MessageLookupByLibrary.simpleMessage(
            "Você foi logado com sucesso!"),
        "signUp": MessageLookupByLibrary.simpleMessage("Registrar"),
        "user": MessageLookupByLibrary.simpleMessage("Usuário")
      };
}
