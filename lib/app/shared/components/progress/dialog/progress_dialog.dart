import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/shared/components/progress/hud/modal_progress_hud.dart';
import 'package:flutter_challenge/app/shared/components/progress/ui/custom_progress_indicator.dart';

class ProgressDialog extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Color color;
  final double opacity;

  const ProgressDialog({
    Key? key,
    required this.isLoading,
    required this.child,
    this.color = Colors.black,
    this.opacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: color,
      opacity: opacity,
      progressIndicator: const CustomProgressIndicator(),
      child: child,
    );
  }
}
