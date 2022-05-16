import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/object/comment.dart';
import 'package:delito/object/user.dart';
import 'package:delito/store/comment/comment_item_container.dart';
import 'package:flutter/material.dart';

class CommentView extends StatefulWidget {
  final int boardId;
  CommentView({required this.boardId});
  @override
  State<CommentView> createState() => _CommentView();
}
class _CommentView extends State<CommentView> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _getComment();
  }

  _getComment() async {

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(testCommentList.length, (index) {
        return CommentItemContainer(comment: testCommentList[index],);
      }) + [
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 36,
                child: DefaultTextField(
                  controller: controller,
                  focusNode: focusNode,
                  hint: '댓글을 입력하세요',
                  callback: _postComment
                )
              )
            ),
            SizedBox(width: 4),
            DefaultButton(title: '입력', callback: controller.text!='' ? _postComment : null, width: 60)
          ]
        )
      ]
    );
  }

  _postComment() async {
    /// todo: send post request
    setState(() {
      testCommentList.add(Comment(userId: 0, userName: userInfo.name, imgUrl: '', content: controller.text, time: '4/6 20:23'));
    });
  }
}