import 'text_input_mask.dart';

const String cpfPattern = '999.999.999-99';
const String cellPhonePattern = '(99) 99999-9999';

MagicMask cpfMask = MagicMask.buildMask(cpfPattern);
MagicMask phoneMask = MagicMask.buildMask(cellPhonePattern);

extension StringExtensions on String? {
  String? get extractNumbers {
    return this?.replaceAll(RegExp(r'[^0-9]'), '');
  }

  bool get isValidCpf => _isValidCpf(this);

  static bool _isValidCpf(String? cpf) {
    if (cpf == null) return false;

    final numbers = cpf.extractNumbers;

    if (numbers!.length != 11) return false;

    final everyCharacterIsTheSame = RegExp(r'^(\d)\1*$').hasMatch(numbers);
    if (everyCharacterIsTheSame) return false;

    final List<int> digits =
        numbers.split('').map((String digit) => int.parse(digit)).toList();

    int calculateFirstDigit = 0;
    for (final i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calculateFirstDigit += digits[10 - i] * i;
    }
    calculateFirstDigit %= 11;
    final firstDigitVerified =
        calculateFirstDigit < 2 ? 0 : 11 - calculateFirstDigit;

    if (digits[9] != firstDigitVerified) return false;

    int calculateSecondDigit = 0;
    for (final i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calculateSecondDigit += digits[11 - i] * i;
    }
    calculateSecondDigit %= 11;
    final secondDigitVerified =
        calculateSecondDigit < 2 ? 0 : 11 - calculateSecondDigit;

    if (digits[10] != secondDigitVerified) return false;

    return true;
  }
}
