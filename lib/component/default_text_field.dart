import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final bool allowEnter;
  final bool isNumber;
  final FocusNode? nextFocusNode;
  final dynamic callback;
  final bool enabled;
  final dynamic changeListener;
  final bool secureText;
  final bool isDialog;
  DefaultTextField({required this.controller, required this.focusNode, required this.hint, this.allowEnter=false, this.nextFocusNode, this.callback, this.enabled=true, this.isNumber=false, this.changeListener, this.secureText=false, this.isDialog=false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      focusNode: focusNode,
      obscureText: secureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10,),
        enabledBorder: enabledBorderDefault(),
        focusedBorder: focusedBorderDefault(),
        disabledBorder: enabledBorderDefault(),
        hintText: hint,
        hintStyle: textStyle(color: Color(0xffd1d5d9), weight: 400, size: 12.0),
      ),
      style: textStyle(weight: 600, size: 12.0),
      keyboardType: isNumber ? TextInputType.number : (allowEnter ? TextInputType.multiline : TextInputType.text),
      textInputAction: allowEnter ? TextInputAction.newline : TextInputAction.done,
      maxLines: isDialog ? 3 : (allowEnter ? 18 : 1),
      onSubmitted: (value) {
        if(callback != null) callback();
        if(allowEnter == false && nextFocusNode != null) nextFocusNode!.requestFocus();
      },
      onChanged: (value) {
        if(changeListener != null) changeListener();
      },
      enabled: enabled,
    );
  }
}