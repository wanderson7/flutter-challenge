import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/api/repository/session_repository.dart';
import 'package:flutter_challenge/app/api/response/server_error.dart';
import 'package:flutter_challenge/app/helpers/dialog_helper.dart';
import 'package:flutter_challenge/app/helpers/router_helper.dart';
import 'package:flutter_challenge/app/shared/model/session/session_model.dart';
import 'package:flutter_challenge/app/shared/user_preferences/shared_preferences_helper.dart';
import 'package:flutter_challenge/generated/l10n.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  SessionRepository _repository = SessionRepository();
  BuildContext context;
  String? emailValue;
  String? passwordValue;
  bool visible = false;

  SignInViewModel(this.context);

  Future onSignIn() async {
    if (hasError) clearErrors();
    final result = await runBusyFuture(
      _repository.onSignInAsync(emailValue, passwordValue),
      throwException: true,
    );
    _showMainPage(result);
  }

  void _showMainPage(SessionModel sessionModel) async {
    await SharedPreferencesHelper.saveUserFromSessionSharedPrefence(
      context,
      sessionModel,
    );
    Navigator.of(context).pushNamedAndRemoveUntil(R.homePage, (route) => false);
  }

  void showSignUpPage() {
    Navigator.of(context).pushNamed(
      R.signUpPage,
    );
  }

  void validateForm() {
    if (formKey.currentState == null) return;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      onSignIn();
    } else {
      autoValidate = AutovalidateMode.always;
      notifyListeners();
    }
  }

  @override
  void onFutureError(dynamic dioError, Object? key) {
    final serverError = ServerError.withError(
      operation: S.current.login.toLowerCase(),
      dioError: dioError,
    );
    D.of(context).showDefaultAlert(serverError.getErrorAPI()?.message);
  }
}
