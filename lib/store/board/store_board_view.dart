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

class StoreBoardView extends StatefulWidget {
  final Board board;
  StoreBoardView({required this.board});
  @override
  State<StoreBoardView> createState() => _StoreBoardView(board);
}
class _StoreBoardView extends State<StoreBoardView> {
  late Board board;
  _StoreBoardView(this.board);

  double? _distance;
  late bool _isMaster;

  @override
  void initState() {
    super.initState();
    _isMaster = userInfo.id == board.userId ? true : false;
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
      board.open = false;
    });
  }

  _boardComplete() async {
    setState(() {
      board.isComplete = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '배달동료 구인', back: true,),
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(board.title, style: textStyle(weight: 700, size: 22.0)),
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
        )
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
                  Expanded(child: Text(board.shopName, style: textStyle(weight: 700, size: 16.0), overflow: TextOverflow.ellipsis,)),
                  SizedBox(width: 4),
                  DefaultButton(title: '식당정보', width: 60, height: 24, fontSize: 12.0, callback: () {
                    /// todo: navigator push to store_shop_view
                    navigatorPush(context: context, widget: StoreRestView(restId: board.id, fromBoard: true,),);
                  }),
                ]
              ),
              SizedBox(height: 6),
              Text('최소주문금액 : ${board.leastPrice}원', style: textStyle(size: 14.0)),
              SizedBox(height: 6),
              Text('배달비 : ${board.deliveryPrice}원', style: textStyle(size: 14.0)),
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
        if(board.open && board.curNum < board.maxNum) {
          _participate();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: board.open && board.curNum < board.maxNum ? Color(0xff0958c5) : Color(0xffd1d5d9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: board.open ? board.curNum < board.maxNum ? [
            Text('모집 완료 시, 배달비 ${(board.deliveryPrice/board.maxNum).ceil()}원 !', style: textStyle(color: Colors.white, weight: 700),),
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
        if(board.open) {
          _boardClose();
        }
        else if(!board.isComplete) {
          _boardComplete();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: board.open || !board.isComplete ? Color(0xff0958c5) : Color(0xffd1d5d9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: board.open ? [
            Text('모집 마감하기', style: textStyle(color: Colors.white, weight: 700),),
          ] : !board.isComplete ? [
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
                      Text(board.userName, style: textStyle(weight: 600)),
                      SizedBox(width: 4.0),
                      Text(_distance != null ? '${_distance!}m' : '', style: textStyle(color: Color(0xffa8a8a8), size: 14.0))
                    ]
                  ),
                  SizedBox(height: 6.0),
                  Text(board.time, style: textStyle(color: Color(0xffa8a8a8), size: 12.0)),
                ]
              )),
              DefaultButton(
                title: '신고하기',
                callback: () {
                  navigatorPush(context: context, widget: ReportView(completeCallback: () {}, isBack: true, userName: board.userName,));
                },
                width: 60, height: 24, fontSize: 12.0,
              )
            ]
          ),
          SizedBox(height: 12),
          Text(board.content, style: textStyle())
        ]
      )
    );
  }
}