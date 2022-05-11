import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget {
  final Color color;
  final double margin;
  LineDivider({this.color=const Color(0xffe3e3e3), this.margin=0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 1,
      margin: EdgeInsets.symmetric(horizontal: margin),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 1
        )
      )
    );
  }
}