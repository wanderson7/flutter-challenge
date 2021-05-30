import 'package:flutter/material.dart';

class TextFormHelper {
  static InputDecoration getDefaultInputDecoration(
    String name, {
    String helperText,
    Widget suffixIcon,
  }) {
    return InputDecoration(
      labelText: name,
      helperText: helperText,
      alignLabelWithHint: true,
      suffixIcon: suffixIcon,
    );
  }
}
