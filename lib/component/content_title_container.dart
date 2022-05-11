import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class ContentTitleContainer extends StatelessWidget {
  final String title;
  ContentTitleContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 19.5, bottom: 16),
      width: MediaQuery.of(context).size.width,
      child: Text(title, style: textStyle(weight: 700, size: 16.0)),
    );
  }
}