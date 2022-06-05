import 'package:delito/style.dart';
import 'package:flutter/material.dart';
import 'package:delito/object/point.dart';
import 'package:delito/function.dart';

class PointItemContainer extends StatelessWidget {
  final Point point;
  PointItemContainer({required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Color(0xffe7e7e7),
          ),
          SizedBox(height: 8),
          Text(dateFormat(point.time), style: textStyle(color: Color(0xff575757), weight: 500, size: 14.0)),
          SizedBox(height: 8),
          Text(point.title, style: textStyle(color: Colors.black, weight: 700, size: 16.0)),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: point.isCharge ? '충전 ' : '사용 ', style: textStyle(weight: 600, size: 14.0)),
                  TextSpan(text: moneyParser(point.amount), style: textStyle(color: point.isCharge ? Colors.blue : Colors.red, weight: 600, size: 14.0)),
                  TextSpan(text: ' P', style: textStyle(weight: 600, size: 14.0)),
                ]
              )
            ),
          ),
          SizedBox(height: 2),
          Align(
            alignment: Alignment.centerRight,
            child: Text('잔액 ${moneyParser(point.left)} P', style: textStyle(color: Color(0xff787878), weight: 500, size: 12.0)),
          ),
          SizedBox(height: 8),
        ]
      )
    );
  }
}