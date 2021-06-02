import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/helpers/asset_helper.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';
import 'package:flutter_challenge/app/helpers/formatter_helper.dart';
import 'package:flutter_challenge/app/helpers/text_input_mask.dart';
import 'package:flutter_challenge/app/helpers/validator_helper.dart';
import 'package:flutter_challenge/app/page/session/sign_up/sign_up_view_model.dart';
import 'package:flutter_challenge/app/shared/components/button/custom_button.dart';
import 'package:flutter_challenge/app/shared/components/progress/dialog/progress_dialog.dart';
import 'package:flutter_challenge/app/shared/components/textForm/password_text_form.dart';
import 'package:flutter_challenge/app/shared/components/ui/sign_up/update_allowed_widget.dart';
import 'package:flutter_challenge/generated/l10n.dart';
import 'package:stacked/stacked.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(context),
      builder: (context, model, child) {
        _viewModel = model;
        return _buildRoot();
      },
    );
  }

  Scaffold _buildRoot() {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  _buildLogoAndTitle(),
                  SizedBox(height: 16),
                  _buildTextFormFieldFullName(),
                  SizedBox(height: 16),
                  _buildTextFormFieldEmail(),
                  SizedBox(height: 16),
                  _buildTextFormFieldCPF(),
                  SizedBox(height: 16),
                  _buildTextFormFieldPhone(),
                  SizedBox(height: 16),
                  _buildTextFormFieldPassword(),
                  SizedBox(height: 16),
                  _buildTextFormConfirmPassword(),
                  SizedBox(height: 16),
                  _buildUpdateAllowed(),
                  SizedBox(height: deviceHeight * 0.1),
                  _buildButtonRegister(),
                  SizedBox(height: 16),
                  _buildTextButtonLoginUser(),
                ],
              ),
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
          S.current.register,
          style: Theme.of(context).textTheme.headline4,
        )
      ],
    );
  }

  Widget _buildTextFormFieldFullName() {
    return TextFormField(
      decoration: InputDecoration(labelText: S.current.fullName),
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => _viewModel.userForm.name = newValue,
      validator: (value) => Validator.fullNameRule(value!),
    );
  }

  Widget _buildTextFormFieldEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: S.current.email),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: Validator.emailRule,
      onSaved: (newValue) => _viewModel.userForm.email = newValue,
    );
  }

  Widget _buildTextFormFieldCPF() {
    return TextFormField(
      decoration: InputDecoration(labelText: S.current.cpf),
      inputFormatters: [TextInputMask(mask: cpfPattern)],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: (value) => Validator.cpfRule(value!),
      onSaved: (newValue) => _viewModel.userForm.cpf = newValue,
    );
  }

  Widget _buildTextFormFieldPhone() {
    return TextFormField(
      decoration: InputDecoration(labelText: S.current.phone),
      inputFormatters: [TextInputMask(mask: cellPhonePattern)],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: (value) => Validator.phoneRule(value!),
      onSaved: (newValue) => _viewModel.userForm.phoneNumber = newValue,
    );
  }

  Widget _buildTextFormFieldPassword() {
    return PasswordTextFormField(
      text: S.current.password,
      textInputAction: TextInputAction.next,
      validator: (text) => Validator.passwordRule(text),
      onChanged: (newValue) => _viewModel.userForm.password = newValue,
    );
  }

  Widget _buildTextFormConfirmPassword() {
    return PasswordTextFormField(
      text: S.current.passwordConfirmation,
      textInputAction: TextInputAction.done,
      validator: (text) =>
          Validator.confirmPasswordRule(_viewModel.userForm.password, text),
    );
  }

  Widget _buildUpdateAllowed() {
    return UpdateAllowedWidget(
      text: S.current.receiveEmailUpdates,
      value: _viewModel.userForm.emailUpdatesAllowed,
      onChanged: _viewModel.onCheckBoxChanged,
    );
  }

  Widget _buildButtonRegister() {
    return CustomButton(
      text: S.current.signUp,
      onPressed: () {
        _viewModel.validateForm();
      },
    );
  }

  Widget _buildTextButtonLoginUser() {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(primary: C.grey),
        onPressed: () => Navigator.of(context).pop(),
        child: RichText(
          text: TextSpan(
            text: S.current.doYouAlreadyHaveAnAccount,
            children: <TextSpan>[
              TextSpan(
                text: S.current.login.toUpperCase(),
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
