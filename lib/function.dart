import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:delito/component/confirm_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

navigatorPush({required context, required widget, replacement=false, all=false}) {
  replacement
    ? all
    ? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget), (route) => false)
    : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget))
    : Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Future<bool> onWillPop(BuildContext context) async {
  return (await showDialog(
    context: context,
    builder: (context) => ConfirmDialog(
      title: '딜리투를 종료하시겠습니까?',
      positiveAction: () {SystemNavigator.pop();},
      negativeAction: () {},
      positiveWord: '종료',
      negativeWord: '취소'
    ),
  )) ?? false;
}

showToast(String message) {
  Fluttertoast.showToast(msg: message,
    gravity: ToastGravity.BOTTOM,
  );
}