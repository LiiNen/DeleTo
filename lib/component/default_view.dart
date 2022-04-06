import 'package:delito/component/default_app_bar.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class DefaultView extends StatelessWidget {
  final String title;
  DefaultView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: title, back: true,),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$title 페이지입니다.', style: textStyle(weight: 600, size: 16.0)),
            SizedBox(height: 14),
            Text('미구현된 페이지입니다.', style: textStyle(weight: 600, size: 16.0)),
            SizedBox(height: 100)
          ]
        )
      )
    );
  }
}