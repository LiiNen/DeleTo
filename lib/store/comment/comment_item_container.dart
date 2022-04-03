import 'package:delito/component/user_profile_image.dart';
import 'package:delito/object/comment.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class CommentItemContainer extends StatelessWidget {
  final Comment comment;
  CommentItemContainer({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffe7e7e7), width: 1),
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserProfileImage(imgSrc: comment.imgSrc, width: 32),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(comment.userName, style: textStyle(weight: 600)),
                    Expanded(child: Text(comment.time, style: textStyle(color: Color(0xffa8a8a8), size: 12.0), textAlign: TextAlign.right,)),
                  ]
                ),
                SizedBox(height: 6),
                Text(comment.content),
              ]
            )
          )
        ]
      )
    );
  }
}
