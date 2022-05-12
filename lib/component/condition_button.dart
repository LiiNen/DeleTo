import 'package:flutter/material.dart';

import 'default_button.dart';

class ConditionButton extends DefaultButton {
  final bool condition;
  ConditionButton({
    required title, required callback, required this.condition, required width,
  }) : super(
    title: title,
    callback: condition ? callback : null,
    color: condition ? Color(0xff0958c5) : Color(0xffd1d5d9),
    fontColor: Colors.white,
    height: 52,
    width: width,
  );
}