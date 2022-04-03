import 'package:delito/component/default_app_bar.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class PointChargeView extends StatelessWidget {
  final bool isCharge;
  PointChargeView({required this.isCharge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: isCharge ? '포인트 충전' : '포인트 출금', back: true,),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('포인트 ${isCharge ? '충전' : '출금'} 페이지입니다.', style: textStyle(weight: 600, size: 16.0)),
            SizedBox(height: 14),
            Text('미구현된 페이지입니다.', style: textStyle(weight: 600, size: 16.0)),
            SizedBox(height: 100)
          ]
        )
      )
    );
  }
}