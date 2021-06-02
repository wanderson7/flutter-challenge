import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/app/helpers/asset_helper.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';
import 'package:flutter_challenge/app/helpers/validator_helper.dart';
import 'package:flutter_challenge/app/shared/components/button/custom_button.dart';
import 'package:flutter_challenge/app/shared/components/progress/dialog/progress_dialog.dart';
import 'package:flutter_challenge/app/shared/components/textForm/password_text_form.dart';
import 'package:stacked/stacked.dart';

import 'sign_in_view_model.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late SignInViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(context),
      builder: (context, model, child) {
        _viewModel = model;
        return _buildRoot();
      },
    );
  }

  AnnotatedRegion<SystemUiOverlayStyle> _buildRoot() {
    final deviceHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Form(
          key: _viewModel.formKey,
          autovalidateMode: _viewModel.autoValidate,
          child: ProgressDialog(
            isLoading: _viewModel.isBusy,
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
                    SizedBox(height: 16),
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
      decoration: InputDecoration(labelText: "E-mail"),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: Validator.emailRule,
      onSaved: (newValue) => _viewModel.emailValue = newValue!.trim(),
    );
  }

  Widget _buildTextFormFieldPassword() {
    return PasswordTextFormField(
      text: "Senha",
      validator: (text) => Validator.passwordRule(text),
      onSaved: (text) => _viewModel.passwordValue = text,
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
        _viewModel.validateForm();
      },
    );
  }

  Widget _buildTextButtonRegisterUser() {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(primary: C.grey),
        onPressed: () => _viewModel.showSignUpPage(),
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
}
