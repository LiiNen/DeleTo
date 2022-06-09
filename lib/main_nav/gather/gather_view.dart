import 'package:delito/api/board_api.dart';
import 'package:delito/api/comment_api.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/function.dart';
import 'package:delito/object/board.dart';
import 'package:delito/object/user.dart';
import 'package:delito/object/comment.dart';
import 'package:delito/store/board/board_item_container.dart';
import 'package:delito/store/board/store_board_view.dart';
import 'package:delito/store/comment/comment_item_container.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class GatherView extends StatefulWidget {
  final dynamic mainCallback;
  GatherView({required this.mainCallback});
  @override
  State<GatherView> createState() => _GatherView();
}
class _GatherView extends State<GatherView> {

  bool isLoaded = false;
  bool hasParty = false;

  List<Board>? _boardList;
  List<Comment>? _commentList;

  @override
  void initState() {
    _getBoardListByUser();
    _getCommentListByUser();
    super.initState();
  }

  _getBoardListByUser() async {
    var _temp = await getBoardListByUser(userId: userInfo.id);
    if(_temp != null) {
      setState(() {
        _boardList = _temp;
        if(_commentList != null) {
          _setGatherState();
        }
      });
    }
  }

  _getCommentListByUser() async {
    var _temp = await getCommentByUser(userId: userInfo.id);
    if(_temp != null) {
      _commentList = _temp;
      if(_boardList != null) {
        _setGatherState();
      }
    }
  }

  _setGatherState() {
    setState(() {
      isLoaded = true;
      hasParty = _boardList!.isNotEmpty || _commentList!.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '내 모집 현황'),
      backgroundColor: Colors.white,
      body: isLoaded ? (
        hasParty ? SingleChildScrollView(
          child: Column(
            children: <Widget> [
              ContentTitleContainer(title: '모임 목록',)
            ] + (_boardList!.isNotEmpty ? List.generate(_boardList!.length, (index) {
              return BoardItemContainer(context: context, board: _boardList![index],);
            }) : [Text('아직 게시물이 없습니다')]) + <Widget> [
              ContentTitleContainer(title: '남긴 댓글 목록',)
            ] + (_commentList!.isNotEmpty ? List.generate(_commentList!.length, (index) {
              return GestureDetector(
                onTap: () {navigatorPush(context: context, widget: StoreBoardView(boardId: _commentList![index].boardId));},
                behavior: HitTestBehavior.translucent,
                child: CommentItemContainer(comment: _commentList![index])
              );
            }) : [Text('아직 댓글이 없습니다')])
          )
        ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('참여 중인 파티가 없습니다.\n직접 모집하거나 댓글을 남겨보세요', style: textStyle(weight: 600, size: 16.0), textAlign: TextAlign.center,),
              SizedBox(height: 14),
              DefaultButton(title: '찾으러 가기', callback: widget.mainCallback)
            ]
          )
        )
      ) : Center(
       child: CircularProgressIndicator()
      )
    );
  }
}