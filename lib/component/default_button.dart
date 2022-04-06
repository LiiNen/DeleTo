import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final dynamic callback;
  final double width;
  final double height;
  final double fontSize;
  DefaultButton({required this.title, required this.callback, this.width=88.0, this.height=36.0, this.fontSize=14.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        callback();
      },
      child: Container(
        width: width, height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffb2b2b2), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Center(
          child: Text(title, style: textStyle(color: Color(0xff787878), weight: 600, size: fontSize))
        )
      )
    );
  }
}