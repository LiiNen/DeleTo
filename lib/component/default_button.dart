import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final dynamic callback;
  final double width;
  final double height;
  DefaultButton({required this.title, required this.callback, this.width=88.0, this.height=36.0});

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
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Center(
          child: Text(title)
        )
      )
    );
  }
}