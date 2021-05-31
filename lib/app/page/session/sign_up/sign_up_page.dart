import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/helpers/asset_helper.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';
import 'package:flutter_challenge/app/helpers/formatter_helper.dart';
import 'package:flutter_challenge/app/helpers/router_helper.dart';
import 'package:flutter_challenge/app/helpers/text_input_mask.dart';
import 'package:flutter_challenge/app/helpers/validator_helper.dart';
import 'package:flutter_challenge/app/shared/components/button/custom_button.dart';
import 'package:flutter_challenge/app/shared/components/textForm/password_text_form.dart';
import 'package:flutter_challenge/app/shared/components/ui/update_allowed_widget.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.disabled;
  String _fullNameValue;
  String _emailValue;
  String _cpfValue;
  String _phoneValue;
  String _passwordValue;
  String _cofirmPasswordValue;
  bool _emailUpdatesAllowed = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: _autoValidate,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: deviceHeight * 0.1),
                _buildLogoAndTitle(),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "Nome Completo"),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) => _fullNameValue = newValue.trim(),
                  validator: (value) => Validator.fieldIsEmpty(value),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validator.emailRule,
                  onSaved: (newValue) => _emailValue = newValue.trim(),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "CPF"),
                  inputFormatters: [TextInputMask(mask: cpfPattern)],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validator.cpfRule(value),
                  onSaved: (newValue) => _cpfValue = newValue.trim(),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: "Celular"),
                  inputFormatters: [TextInputMask(mask: cellPhonePattern)],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validator.phoneRule(value),
                  onSaved: (newValue) => _phoneValue = newValue.trim(),
                ),
                SizedBox(height: 16),
                _buildTextFormFieldPassword(),
                SizedBox(height: 16),
                _buildTextFormConfirmPassword(),
                SizedBox(height: 16),
                UpdateAllowedWidget(
                  text: "Receber atualizações por e-mail",
                  value: _emailUpdatesAllowed,
                  onChanged: _onCheckBoxChanged,
                ),
                SizedBox(height: deviceHeight * 0.1),
                _buildButtonRegister(),
                SizedBox(height: 16),
                _buildTextButtonLoginUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoAndTitle() {
    return Row(
      children: [
        Image(
          fit: BoxFit.fitWidth,
          image: AssetImage(AssetHelper.ilLogo),
        ),
        SizedBox(width: 16),
        Text(
          "Registro",
          style: Theme.of(context).textTheme.headline4,
        )
      ],
    );
  }

  Widget _buildTextFormFieldPassword() {
    return PasswordTextFormField(
      text: "Senha",
      textInputAction: TextInputAction.next,
      validator: (text) => Validator.passwordRule(text),
      onChanged: (newValue) => _passwordValue = newValue,
    );
  }

  Widget _buildTextFormConfirmPassword() {
    return PasswordTextFormField(
      text: "Confirmação de Senha",
      textInputAction: TextInputAction.done,
      validator: (text) => Validator.confirmPasswordRule(_passwordValue, text),
      onSaved: (text) => _cofirmPasswordValue = text,
    );
  }

  Widget _buildButtonRegister() {
    return CustomButton(
      text: "Registrar",
      onPressed: () {
        _validateForm();
      },
    );
  }

  Widget _buildTextButtonLoginUser() {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(primary: C.grey),
        onPressed: () => showSignUpPage(),
        child: RichText(
          text: TextSpan(
            text: 'Já possui uma conta? ',
            children: const <TextSpan>[
              TextSpan(
                text: "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: C.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCheckBoxChanged(bool newValue) {
    setState(() {
      _emailUpdatesAllowed = newValue;
    });
  }

  void showSignUpPage() {
    Navigator.of(context).pop();
  }

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }
}
