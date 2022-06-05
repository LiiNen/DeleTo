import 'package:delito/component/user_profile_image.dart';
import 'package:delito/main_nav/report/report_view.dart';
import 'package:delito/object/comment.dart';
import 'package:delito/object/user.dart';
import 'package:delito/style.dart';
import 'package:delito/function.dart';
import 'package:flutter/material.dart';

class CommentItemContainer extends StatelessWidget {
  final Comment comment;
  CommentItemContainer({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xffe3e3e3), width: 1))
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 32),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(comment.userName, style: textStyle(weight: 600)),
                    SizedBox(width: 8.0),
                    Expanded(child: Text(dateFormat(comment.time), style: textStyle(color: Color(0xffa8a8a8), size: 12.0), textAlign: TextAlign.left,)),
                    userInfo.id != comment.userId ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        navigatorPush(context: context, widget: ReportView(completeCallback: (){}, isBack: true, userName: comment.userName,));
                      },
                      child: Container(
                        width: 24, height: 24,
                        child: Center(
                          child: Icon(Icons.assistant_photo_outlined, size: 18.0, color: Color(0xffa8a8a8)),
                        )
                      )
                    ) : Container(),
                  ]
                ),
                Text(comment.content),
              ]
            )
          )
        ]
      )
    );
  }
}
