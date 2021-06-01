import 'constants.dart';
import 'formatter_helper.dart';

class Validator {
  static String? fieldIsEmpty(String? value) {
    if (value == null) return "Campo obrigatório";
    if (value.trim().isEmpty) return "Campo obrigátorio";
    return null;
  }

  static String? emailRule(String? value) {
    if (value!.isEmpty) return 'Campo obrigatório';
    const Pattern pattern =
        r'^[a-zA-Z0-9.!\#$%&"*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
    final regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value.trim())) return "Informe um e-mail válido";
    return null;
  }

  static String? passwordRule(String? value) {
    if (value == null) return "Campo obrigatório";
    if (value.isEmpty) return "Campo obrigatório";
    if (value.length < 8) return "Mínimo 8 caracteres, letras e números.";
    const String pattern = r'(?=.*[a-zA-Z])(?=.*[\d]).+';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) return "Mínimo 8 caracteres, letras e números.";
    return null;
  }

  static String? confirmPasswordRule(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null) return "Campo obrigatório";

    if (confirmPassword.isEmpty) return "Campo obrigatório";

    if (password != null) {
      if (confirmPassword.isEmpty) return "Campo obrigatório";

      return confirmPassword != password
          ? "Senha e confirmação de senha não coincidem."
          : null;
    }

    return null;
  }

  static String? cpfRule(String? value, {int cpfLength = 14}) {
    if (value == null) return "Campo obrigatório";
    if (value.isEmpty) return "Campo obrigatório";
    if (value.length != cpfLength || !value.isValidCpf)
      return "Por favor, informe um CPF válido.";
    return null;
  }

  static String? phoneRule(String? value) {
    if (value == null) return "Campo obrigatório";
    if (value.isEmpty) return "Campo obrigatório";
    if (value.length < K.phoneNumberLength ||
        value.length > K.phoneNumberLength + 1) {
      return "Informe um celular válido.";
    }
    return null;
  }
}
