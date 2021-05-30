import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';
import 'package:flutter_challenge/app/helpers/text_helper.dart';

enum CustomButtonVariant {
  raised,
  flat,
  outline,
}

class CustomButton extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final double fontSize;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final CustomButtonVariant variant;
  final double height;
  final IconData iconPath;
  final bool enable;

  const CustomButton({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.enable = true,
    this.margin = const EdgeInsets.all(0),
    this.fontSize = 16,
    this.color = C.accent,
    this.textColor = Colors.white,
    this.variant = CustomButtonVariant.raised,
    this.height = 64,
    this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      child: _getChosenButton(context, variant),
    );
  }

  Widget _getChosenButton(BuildContext context, CustomButtonVariant variant) {
    switch (variant) {
      case CustomButtonVariant.flat:
        return TextButton(
          onPressed: _getOnPressed(),
          child: _buildButtonContent(context),
        );
      case CustomButtonVariant.outline:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: _getBorderRadius(),
            side: BorderSide(color: _getColor()),
            primary: Colors.transparent,
            textStyle: _getTextSyle(context),
          ),
          onPressed: _getOnPressed(),
          child: _buildButtonContent(context),
        );
      default:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: _getBorderRadius(),
            primary: _getColor(),
            textStyle: _getTextSyle(context),
          ),
          onPressed: _getOnPressed(),
          child: _buildButtonContent(context),
        );
    }
  }

  Color _getColor() {
    return enable ? color : Colors.grey[200];
  }

  VoidCallback _getOnPressed() {
    return enable ? onPressed : null;
  }

  TextStyle _getTextSyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2.copyWith(
          fontWeight: TextHelper.bold,
          color: textColor,
          fontSize: fontSize,
        );
  }

  RoundedRectangleBorder _getBorderRadius() {
    return RoundedRectangleBorder(
      side: BorderSide(color: _getColor()),
      borderRadius: BorderRadius.circular(16.0),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
          ),
          Visibility(
            visible: iconPath != null,
            child: Positioned(
              right: 8,
              child: Icon(iconPath),
            ),
          ),
        ],
      ),
    );
  }
}
