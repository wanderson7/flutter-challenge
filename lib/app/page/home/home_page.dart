import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/app/helpers/asset_helper.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';
import 'package:flutter_challenge/app/helpers/text_form_helper.dart';
import 'package:flutter_challenge/app/helpers/validator_helper.dart';
import 'package:flutter_challenge/app/shared/components/button/custom_button.dart';
import 'package:flutter_challenge/app/shared/components/textForm/password_text_form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  var _autoValidate = AutovalidateMode.disabled;
  final _focusPassword = FocusNode();
  String _emailValue;
  String _passwordValue;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: C.primary,
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
                  _buildImageLogo(),
                  SizedBox(height: 32),
                  _buildTextDescription(context),
                  _buildTextTitle(context),
                  SizedBox(height: 32),
                  _buildTextFormFieldEmail(),
                  SizedBox(height: 24),
                  _buildTextFormFieldPassword(),
                  SizedBox(height: 16),
                  _buildTextButtonForgetPassword(),
                  SizedBox(height: deviceHeight * 0.1),
                  _buildButtonLogin(),
                  SizedBox(height: 16),
                  _buildTextButtonRegisterUser(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageLogo() {
    return Image(
      fit: BoxFit.fitWidth,
      image: AssetImage(AssetHelper.ilLogo),
    );
  }

  Widget _buildTextDescription(BuildContext context) {
    return Text(
      "Continue com o seu",
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildTextTitle(BuildContext context) {
    return Text(
      "Login",
      style: Theme.of(context).textTheme.headline4,
    );
  }

  Widget _buildTextFormFieldEmail() {
    return TextFormField(
      decoration: TextFormHelper.getDefaultInputDecoration(
        "E-mail",
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => _emailValue = newValue.trim(),
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(_focusPassword),
      validator: Validator.emailRule,
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildTextFormFieldPassword() {
    return PasswordTextFormField(
      text: "Senha",
      focusNode: _focusPassword,
      onSaved: (text) => _passwordValue = text,
    );
  }

  Widget _buildTextButtonForgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: TextButton.styleFrom(primary: C.white),
        onPressed: () {},
        child: Text("Esqueceu sua senha?"),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return CustomButton(
      text: "Login",
      onPressed: () {
        _validateForm();
      },
    );
  }

  Widget _buildTextButtonRegisterUser() {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(primary: C.grey),
        onPressed: () {},
        child: RichText(
          text: TextSpan(
            text: 'Não tem uma conta? ',
            children: const <TextSpan>[
              TextSpan(
                text: "REGISTRE-SE",
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

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }
}
