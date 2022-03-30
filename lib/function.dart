import 'package:flutter/material.dart';

navigatorPush({required context, required widget, replacement=false, all=false}) {
  replacement
    ? all
    ? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (route) => false)
    : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget))
    : Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}