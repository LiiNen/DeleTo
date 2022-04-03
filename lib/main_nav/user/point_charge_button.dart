import 'package:delito/function.dart';
import 'package:delito/main_nav/user/point_charge_view.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class PointChargeButton extends StatelessWidget {
  final bool isCharge;
  PointChargeButton({this.isCharge=true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        navigatorPush(context: context, widget: PointChargeView(isCharge: isCharge));
      },
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Color(0xffff9933))
        ),
        child: Center(
          child: Text(isCharge ? '충전하기' : '출금하기', style: textStyle(weight: 500),),
        )
      )
    );
  }
}