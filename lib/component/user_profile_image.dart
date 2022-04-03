import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final double width;
  final String imgSrc;
  UserProfileImage({this.width=48.0, this.imgSrc=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: imgSrc == '' ?
        Image.asset('asset/pointIcon.png', width: width) :
        Image.network(imgSrc, width: width),
    );
  }
}