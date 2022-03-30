import 'package:flutter/material.dart';

TextStyle textStyle({color: const Color(0xff3c354d), weight: int, double size: 14.0, double spacing: 0}) {
  FontWeight fontWeight = FontWeight.normal;
  switch(weight) {
    case 400:
      fontWeight = FontWeight.w400;
      break;
    case 500:
      fontWeight = FontWeight.w500;
      break;
    case 600:
      fontWeight = FontWeight.w600;
      break;
    case 700:
      fontWeight = FontWeight.w700;
      break;
  }
  return TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontFamily: "NotoSansCJKKR",
      fontStyle: FontStyle.normal,
      letterSpacing: spacing,
      fontSize: size
  );
}

enabledBorderDefault() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color(0xfff0f0f0), width: 1),
  );
}

focusedBorderDefault() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(2),
    borderSide: BorderSide(color: Color(0xff0958c5), width: 1),
  );
}