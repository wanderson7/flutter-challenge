import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      height: 100,
      width: 100,
      child: Center(
        child: _getProgressIndicator(context),
      ),
    );
  }

  Widget _getProgressIndicator(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator(
        radius: 18,
      );
    }
    return const CircularProgressIndicator(color: C.accent,);
  }
}
