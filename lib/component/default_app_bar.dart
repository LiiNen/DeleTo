import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final bool back;
  final dynamic backCallback;
  final Color color;
  final dynamic tapAction;
  final double elevation;
  DefaultAppBar({required this.title, this.back=false, this.backCallback, this.color=Colors.white, this.tapAction, this.elevation=1.0}) : preferredSize = Size.fromHeight(44.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      centerTitle: true,
      backgroundColor: color,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if(tapAction != null) {
            tapAction();
          }
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              back ? backButton(context) : SizedBox(width: 24),
              tapAction != null ? Row(
                children: [
                  Text(title, style: textStyle(weight: 700, size: 16.0)),
                  SizedBox(width: 6),
                  Icon(Icons.edit_location_outlined, size: 16.0, color: Colors.black),
                ]
              ) : Text(title, style: textStyle(weight: 700, size: 16.0)),
              SizedBox(width: 24),
            ]
          )
        )
      )
    );
  }

  backButton(context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pop(context);
        if(backCallback != null) backCallback();
      },
      child: Container(
        width: 24, height: 24,
        child: Center(
          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        )
      )
    );
  }
}