import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final dynamic callback;
  final double width;
  final double height;
  final double fontSize;
  final Color fontColor;
  final Color color;
  final bool hasBorder;
  DefaultButton({required this.title, required this.callback, this.width=88.0, this.height=36.0, this.fontSize=14.0, this.color=Colors.white, this.fontColor=const Color(0xff787878), this.hasBorder=true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(callback != null) {
          callback();
        }
      },
      child: Container(
        width: width, height: height,
        decoration: BoxDecoration(
          border: hasBorder ? Border.all(color: Color(0xffb2b2b2), width: 1) : Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: color,
        ),
        child: Center(
          child: Text(title, style: textStyle(color: fontColor, weight: 600, size: fontSize))
        )
      )
    );
  }
}