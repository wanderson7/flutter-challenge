import 'package:flutter_challenge/generated/l10n.dart';

import 'constants.dart';
import 'formatter_helper.dart';

class Validator {
  static String? fullNameRule(String? value) {
    if (value == null) return S.current.requiredField;
    if (value.trim().isEmpty) return S.current.requiredField;
    const String pattern = r'^(?:.*\b\w{3,}\b.*){2,}$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) return S.current.requiredFieldValidFullName;
    return null;
  }

  static String? emailRule(String? value) {
    if (value!.isEmpty) return S.current.requiredField;
    const Pattern pattern =
        r'^[a-zA-Z0-9.!\#$%&"*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
    final regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value.trim())) return S.current.email;
    return null;
  }

  static String? passwordRule(String? value) {
    if (value == null) return S.current.requiredField;
    if (value.isEmpty) return S.current.requiredField;
    if (value.length < K.passwordLength) return S.current.requiredFieldValidPassword;
    const String pattern = r'^(?=.*\d)(?=.*[A-Z])[0-9a-zA-Z]{8,}$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) return S.current.requiredFieldValidPassword;
    return null;
  }

  static String? confirmPasswordRule(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null) return S.current.requiredField;

    if (confirmPassword.isEmpty) return S.current.requiredField;

    if (password != null) {
      if (confirmPassword.isEmpty) return S.current.requiredField;

      return confirmPassword != password
          ? S.current.requiredFieldConfirmPassword
          : null;
    }

    return null;
  }

  static String? cpfRule(String? value, {int cpfLength = K.cpfLength}) {
    if (value == null) return S.current.requiredField;
    if (value.isEmpty) return S.current.requiredField;
    if (value.length != cpfLength || !value.isValidCpf)
      return S.current.requiredFieldValidCPF;
    return null;
  }

  static String? phoneRule(String? value) {
    if (value == null) return S.current.requiredField;
    if (value.isEmpty) return S.current.requiredField;
    if (value.length < K.phoneNumberLength ||
        value.length > K.phoneNumberLength + 1) {
      return S.current.requiredFieldValidPhoneNumber;
    }
    return null;
  }
}
