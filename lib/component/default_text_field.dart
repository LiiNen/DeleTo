import 'package:flutter/material.dart';
import 'package:deleto/style.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final bool allowEnter;
  final FocusNode? nextFocusNode;
  final dynamic callback;
  DefaultTextField({required this.controller, required this.focusNode, required this.hint, this.allowEnter=false, this.nextFocusNode, this.callback});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      focusNode: focusNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10,),
        enabledBorder: enabledBorderDefault(),
        focusedBorder: focusedBorderDefault(),
        hintText: hint,
        hintStyle: textStyle(color: Color(0xffd1d5d9), weight: 400, size: 12.0),
      ),
      style: textStyle(weight: 600, size: 12.0),
      keyboardType: allowEnter ? TextInputType.multiline : TextInputType.text,
      textInputAction: allowEnter ? TextInputAction.newline : TextInputAction.done,
      maxLines: allowEnter ? 18 : 1,
      onSubmitted: (value) {
        if(callback != null) callback();
        if(allowEnter == false && nextFocusNode != null) nextFocusNode!.requestFocus();
      },
    );
  }
}