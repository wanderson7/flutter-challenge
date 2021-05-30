
class Validator {
  static String fieldIsEmpty(String value) {
    if (value.trim().isEmpty) return "Campo obrigátorio";

    return null;
  }

  static String emailRule(String value) {
    if (value.isEmpty) return "Informe o e-mail";

    const Pattern pattern =
        r'^[a-zA-Z0-9.!\#$%&"*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
    final regex = RegExp(pattern.toString());

    if (!regex.hasMatch(value.trim())) return "Informe um e-mail válido";

    return null;
  }

  static String passwordRule( String value) {
    if (value.isEmpty) {
      return "Informe a senha";
    }

    if (value.length < 8) {
      return "Mínimo 8 caracteres, letras e números.";
    }

    const String pattern = r'(?=.*[a-zA-Z])(?=.*[\d]).+';
    final RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return "Mínimo 8 caracteres, letras e números.";
    }

    return null;
  }
}
