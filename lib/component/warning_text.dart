import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class WarningText extends StatelessWidget {
  final bool isDefault;
  final String defaultMessage;
  final bool isError;
  final String errorMessage;
  final String successMessage;
  WarningText({required this.isDefault, required this.defaultMessage, required this.isError, required this.errorMessage, required this.successMessage});

  @override
  Widget build(BuildContext context) {
    return isDefault ? Text(defaultMessage, style: textStyle(color: Color(0xff636c73), weight: 400, size: 12.0)) :
      (isError ?
        Text(errorMessage, style: textStyle(color: Color(0xffd93826), weight: 400, size: 12.0)) :
        Text(successMessage, style: textStyle(color: Colors.lightGreen, weight: 400, size: 12.0))
      );
  }
}