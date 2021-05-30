import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';
import 'package:flutter_challenge/app/helpers/validator_helper.dart';

class PasswordTextFormField extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onFieldSubmitted;
  final TextInputAction textInputAction;
  final FocusNode focusNode;

  const PasswordTextFormField({
    Key key,
    this.text,
    this.onSaved,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.controller,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      obscureText: !_visible,
      decoration: _getInputDecoration(),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (text) => Validator.passwordRule(text),
      onSaved: widget.onSaved,
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      labelText: widget.text,
      suffixIcon: GestureDetector(
        onTap: _togglePasswordVisibility,
        child: Icon(
          _visible ? Icons.visibility : Icons.visibility_off,
          color: C.grey,
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() => _visible = !_visible);
  }
}
