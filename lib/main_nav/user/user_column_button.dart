import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class UserColumnButton extends StatelessWidget {
  final dynamic callback;
  final String title;
  final String content;
  UserColumnButton({this.callback, required this.title, this.content=''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {if(callback != null) callback();},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: textStyle(color: Color(0xff7c7c7c), weight: 500, size: 13.0)),
            Text(content, style: textStyle(color: Color(0xffd1d1d1), weight: 400, size: 13.0)),
          ]
        )
      )
    );
  }
}