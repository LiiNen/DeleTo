import 'package:delito/component/condition_button.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/input_dialog.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/report/report_view.dart';
import 'package:delito/object/board.dart';
import 'package:delito/object/restaurant.dart';
import 'package:delito/object/user.dart';
import 'package:delito/store/comment/comment_view.dart';
import 'package:delito/store/shop/store_rest_view.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';

import 'board_setting_view.dart';

class StoreBoardView extends StatefulWidget {
  final int boardId;
  StoreBoardView({required this.boardId});
  @override
  State<StoreBoardView> createState() => _StoreBoardView(boardId);
}
class _StoreBoardView extends State<StoreBoardView> {
  int boardId;
  _StoreBoardView(this.boardId);

  Board? _board;

  double? _distance;
  late bool _isMaster;

  @override
  void initState() {
    _getBoardInfo();
    super.initState();

  }

  void _getBoardInfo() async {
    setState(() {
      _board = testBoardList[0];
      _isMaster = userInfo.id == _board!.userId ? true : false;
    });
    _calDistance();
  }

  void _calDistance() {
    /// todo: cal distance
    setState(() {
      _distance = 400;
    });
  }

  _participate() async {
    return (await showDialog(
      context: context,
      builder: (context) => InputDialog(
        title: '모임 신청', confirmAction: (message, point) {_participateAction(message, point);},
        confirmWord: '포인트 지불 후 참여'
      ),
    )) ?? false;
  }

  _participateAction(String message, String point) async {
    /// todo: post message, point
    /// error handling with point
  }

  _boardClose() async {
    setState(() {
      _board!.open = false;
    });
  }

  _boardComplete() async {
    setState(() {
      _board!.isComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '배달동료 구인', back: true,),
        backgroundColor: Colors.white,
        body: _board != null ? Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(_board!.title, style: textStyle(weight: 700, size: 22.0)),
                SizedBox(height: 24),
                partyInfoBox(),
                SizedBox(height: 24),
                _isMaster ? masterButton() : gatherButton(),
                SizedBox(height: 24),
                contentBox(),
                SizedBox(height: 40),
                ContentTitleContainer(title: '댓글'),
                CommentView(boardId: 1,),
                SizedBox(height: 20),
              ]
            )
          )
        ) : Container()
      )
    );
  }

  partyInfoBox() {
    return Row(
      children: [
        FlutterLogo(size: 62,),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(_board!.shopName, style: textStyle(weight: 700, size: 16.0), overflow: TextOverflow.ellipsis,)),
                  SizedBox(width: 4),
                  DefaultButton(title: '식당정보', width: 60, height: 24, fontSize: 12.0, callback: () {
                    /// todo: navigator push to store_shop_view
                    navigatorPush(context: context, widget: StoreRestView(restId: _board!.id, fromBoard: true,),);
                  }),
                ]
              ),
              SizedBox(height: 6),
              Text('최소주문금액 : ${_board!.leastPrice}원', style: textStyle(size: 14.0)),
              SizedBox(height: 6),
              Text('배달비 : ${_board!.deliveryPrice}원', style: textStyle(size: 14.0)),
            ]
          )
        )
      ]
    );
  }

  gatherButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(_board!.open && _board!.curNum < _board!.maxNum) {
          _participate();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: _board!.open && _board!.curNum < _board!.maxNum ? Color(0xff0958c5) : Color(0xffd1d5d9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _board!.open ? _board!.curNum < _board!.maxNum ? [
            Text('모집 완료 시, 배달비 ${(_board!.deliveryPrice/_board!.maxNum).ceil()}원 !', style: textStyle(color: Colors.white, weight: 700),),
            Text('참여하기', style: textStyle(color: Colors.white, weight: 700)),
          ] : [
            Text('현재 정원이 모두 모집되었습니다.', style: textStyle(color: Colors.white, weight: 700))
          ] : [
            Text('모집이 완료된 글입니다.', style: textStyle(color: Colors.white, weight: 700))
          ]
        )
      )
    );
  }

  masterButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(_board!.open) {
          navigatorPush(context: context, widget: BoardSettingView(boardId: 2, backCallback: _getBoardInfo));
        }
        else if(!_board!.isComplete) {
          _boardComplete();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: _board!.open || !_board!.isComplete ? Color(0xff0958c5) : Color(0xffd1d5d9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _board!.open ? [
            Text('종료하기', style: textStyle(color: Colors.white, weight: 700),),
          ] : !_board!.isComplete ? [
            Text('전달 완료', style: textStyle(color: Colors.white, weight: 700))
          ] : [
            Text('종료된 게시글입니다', style: textStyle(color: Colors.white, weight: 700))
          ]
        )
      )
    );
  }

  contentBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(_board!.userName, style: textStyle(weight: 600)),
                      SizedBox(width: 4.0),
                      Text(_distance != null ? '${_distance!}m' : '', style: textStyle(color: Color(0xffa8a8a8), size: 14.0))
                    ]
                  ),
                  SizedBox(height: 6.0),
                  Text(_board!.time, style: textStyle(color: Color(0xffa8a8a8), size: 12.0)),
                ]
              )),
              userInfo.id != _board!.userId ? DefaultButton(
                title: '신고하기',
                callback: () {
                  navigatorPush(context: context, widget: ReportView(completeCallback: () {}, isBack: true, userName: _board!.userName,));
                },
                width: 60, height: 24, fontSize: 12.0,
              ) : Container(),
            ]
          ),
          SizedBox(height: 12),
          Text(_board!.content, style: textStyle())
        ]
      )
    );
  }
}