import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';

class UpdateAllowedWidget extends StatelessWidget {
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  const UpdateAllowedWidget({
    Key key,
    @required this.text,
    @required this.value,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildSwitch(context) : _buildCheckBox(context);
  }

  Widget _buildSwitch(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyText1)),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckBox(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        children: <Widget>[
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            onChanged: onChanged,
            activeColor: C.accent,
          ),
          Text(text),
        ],
      ),
    );
  }
}
