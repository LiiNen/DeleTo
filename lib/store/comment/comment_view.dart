import 'package:delito/api/comment_api.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/function.dart';
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

  List<Comment>? _commentList;

  @override
  void initState() {
    super.initState();
    _getCommentList();
  }

  _getCommentList() async {
    var _temp = await getCommentByBoardId(boardId: widget.boardId);
    if(_temp == null) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      setState(() {
        _commentList = _temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _commentList != null ? Column(
      children: (_commentList!.length > 0 ? List<Widget>.generate(_commentList!.length, (index) {
        return CommentItemContainer(comment: _commentList![index],);
      }) : <Widget>[
        Text('아직 댓글이 없습니다'),
      ]) + [
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
            DefaultButton(title: '입력', callback: _postComment, width: 60)
          ]
        )
      ]
    ) : Container();
  }

  _postComment() async {
    if(controller.text == '') {
      showToast('내용을 입력해주세요');
      return;
    }
    var _status = await postComment(boardId: widget.boardId, content: controller.text);
    if(_status == false) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      _getCommentList();
    }
  }
}