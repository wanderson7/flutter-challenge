import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/generated/l10n.dart';

import 'colors_helper.dart';

class D {
  D(this.context);

  final BuildContext context;

  static D of(BuildContext context) {
    return D(context);
  }

  Future<T?> showAlert<T>({
    String? title,
    String? message,
    String? cancelButton,
    String? confirmButton,
    VoidCallback? onPressedCancel,
    VoidCallback? onPressedConfirm,
  }) {
    FocusScope.of(context).unfocus();

    final List<Widget> actions = [];

    if (cancelButton != null) {
      Widget actionButtonOne;

      if (Platform.isIOS) {
        actionButtonOne = CupertinoDialogAction(
          onPressed: onPressedCancel,
          child: Text(cancelButton),
        );
      } else {
        actionButtonOne = TextButton(
          onPressed: onPressedCancel,
          style: TextButton.styleFrom(primary: C.white),
          child: Text(cancelButton),
        );
      }

      actions.add(actionButtonOne);
    }

    if (confirmButton != null) {
      Widget actionButtonTwo;

      if (Platform.isIOS) {
        actionButtonTwo = CupertinoDialogAction(
          onPressed: onPressedConfirm,
          child: Text(confirmButton),
        );
      } else {
        actionButtonTwo = TextButton(
          onPressed: onPressedConfirm,
          style: TextButton.styleFrom(primary: C.accent),
          child: Text(confirmButton),
        );
      }

      actions.add(actionButtonTwo);
    }

    Widget alert;

    if (Platform.isIOS) {
      alert = CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title ?? S.current.headsUp,
          ),
        ),
        content: _getMessage(message),
        actions: actions,
      );
    } else {
      alert = AlertDialog(
        contentPadding: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        title: Text(
          title ?? S.current.headsUp,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.black87),
        ),
        content: _getMessage(message),
        actions: actions,
      );
    }

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<T?> showDefaultAlert<T>([String? message]) {
    return showAlert(
      message: message ?? S.current.checkConnectionInternet,
      confirmButton: S.current.ok,
      onPressedConfirm: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _getMessage(String? message) {
    return Text(
      message ?? S.current.checkConnectionInternet,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: Colors.grey[700]),
    );
  }
}
