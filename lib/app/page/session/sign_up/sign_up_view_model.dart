import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/api/repository/session_repository.dart';
import 'package:flutter_challenge/app/api/response/server_error.dart';
import 'package:flutter_challenge/app/helpers/dialog_helper.dart';
import 'package:flutter_challenge/app/helpers/router_helper.dart';
import 'package:flutter_challenge/app/shared/model/form/user_form.dart';
import 'package:flutter_challenge/app/shared/model/session/session_model.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;
  SessionRepository _repository = SessionRepository();
  BuildContext context;
  UserForm userForm = UserForm();

  SignUpViewModel(this.context);

  Future onSignUp() async {
    if (hasError) clearErrors();
    final result = await runBusyFuture(
      _repository.onSignUpAsync(userForm),
      throwException: true,
    );
    onShowMainPage(result);
  }

  void onShowMainPage(SessionModel sessionModel) {
    D.of(context).showDefaultAlert(sessionModel.user?.name);
  }

  void validateForm() {
    if (formKey.currentState == null) return;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      onSignUp();
    } else {
      autoValidate = AutovalidateMode.always;
      notifyListeners();
    }
  }

  void onCheckBoxChanged(bool? newValue) {
    userForm.emailUpdatesAllowed = newValue ?? false;
    notifyListeners();
  }

  @override
  void onFutureError(dynamic dioError, Object? key) {
    final serverError = ServerError.withError(
        operation: "Login".toLowerCase(), dioError: dioError);
    D.of(context).showDefaultAlert(serverError.getErrorAPI()?.message);
  }
}
