import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:delito/component/confirm_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

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

getTimeSafe({required String openTime, required String closeTime}) {
  var nowDate = DateTime.now();
  var openHour = int.parse(openTime.split(':')[0]);
  var openMinute = int.parse(openTime.split(':')[1]);
  var closeHour = int.parse(closeTime.split(':')[0]);
  var closeMinute = int.parse(closeTime.split(':')[1]);

  bool nowDawn = false;
  bool closeDawn = false;
  if(nowDate.hour < 7) {
    nowDawn = true;
  }
  if(closeHour < 7) {
    closeDawn = true;
  }

  DateTime openDate = DateTime(nowDate.year, nowDate.month, nowDawn ? nowDate.day-1 : nowDate.day, openHour, openMinute);
  DateTime closeDate = DateTime(nowDate.year, nowDate.month, !nowDawn&&closeDawn ? nowDate.day+1 : nowDate.day, closeHour, closeMinute);

  if(nowDate.isAfter(openDate) && nowDate.isBefore(closeDate)) {
    return true;
  }
  else {
    return false;
  }
}

String moneyParser(int target) {
  var f = NumberFormat('###,###,###,###');
  return f.format(target);
}