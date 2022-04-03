import 'package:delito/store/comment/comment_item_container.dart';
import 'package:flutter/material.dart';

class CommentView extends StatefulWidget {
  final dynamic commentList;
  CommentView({required this.commentList});
  @override
  State<CommentView> createState() => _CommentView();
}
class _CommentView extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(widget.commentList.length, (index) {
        return CommentItemContainer(comment: widget.commentList[index],);
      }) + [
        SizedBox(height: 12),
        Text('아무튼 댓글 입력하는 창')
      ]
    );
  }
}