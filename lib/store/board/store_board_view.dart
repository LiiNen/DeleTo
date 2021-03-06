import 'package:delito/api/board_api.dart';
import 'package:delito/api/party_api.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/input_dialog.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/main_nav_view.dart';
import 'package:delito/main_nav/report/report_view.dart';
import 'package:delito/object/board.dart';
import 'package:delito/object/user.dart';
import 'package:delito/store/comment/comment_view.dart';
import 'package:delito/store/rest/store_rest_view.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'board_setting_view.dart';

class StoreBoardView extends StatefulWidget {
  final int boardId;
  final dynamic backCallback;
  StoreBoardView({required this.boardId, this.backCallback});
  @override
  State<StoreBoardView> createState() => _StoreBoardView();
}
class _StoreBoardView extends State<StoreBoardView> {
  Board? _board;

  String? _distString;
  late bool _isMaster;

  @override
  void initState() {
    _getBoardInfo();
    super.initState();
  }

  void _getBoardInfo() async {
    _board = await getBoardDetail(boardId: widget.boardId);
    if(_board == null) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      setState(() {
        _isMaster = userInfo.id == _board!.userId ? true : false;
      });
      _calDist();
    }
  }

  void _calDist() async {
    final pref = await SharedPreferences.getInstance();
    var lat = pref.getDouble('lat') ?? 0.0;
    var lng = pref.getDouble('lng') ?? 0.0;
    setState(() {
      if(lat == 0.0 && lng == 0.0) {
        _distString = null;
      }
      else {
        _distString = calDist(lat1: lat, lng1: lng, lat2: _board!.lat, lng2: _board!.lng);
      }
    });
  }

  _participate() async {
    return (await showDialog(
      context: context,
      builder: (context) => InputDialog(
        title: '파티 참가', confirmAction: (message, point) {_participateAction(message, point);},
        confirmWord: '포인트 지불 후 참여'
      ),
    )) ?? false;
  }

  _participateAction(String message, String point) async {
    if(message == '') {
      showToast('메세지를 입력해주세요');
    }
    else if(int.parse(point) > userInfo.point) {
      showToast('포인트가 부족합니다');
    }
    else {
      var _statusCode = await joinParty(boardId: widget.boardId, content: message, point: point);
      if(_statusCode == 200) {
        showToast('참가 신청 메세지를 보냈습니다');
      }
      else if(_statusCode == 411) {
        showToast('데이터 생성실패');
      }
      else if(_statusCode == 412) {
        showToast('input error');
      }
      else if(_statusCode == 421) {
        showToast('파티원이 가득 찼습니다.');
      }
      else if(_statusCode == 422) {
        showToast('마감된 파티입니다.');
      }
      else if(_statusCode == 425) {
        showToast('이미 참여 신청을 완료했습니다.');
      }
      else if(_statusCode == 430) {
        showToast('잔고가 부족합니다.');
      }
      else {
        showToast('네트워크를 확인해주세요.\n반복시 관리자에게 문의해주세요');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '배달동료 구인', back: true, backCallback: () {
          if(widget.backCallback != null) widget.backCallback();
        },),
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
                CommentView(boardId: widget.boardId,),
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
        _board!.imgUrl != '' ? Image.network(_board!.imgUrl, width: 62, height: 62) : FlutterLogo(size: 62),
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
        if(!_board!.isComplete && _board!.curNum != _board!.maxNum) {
          _participate();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: !_board!.isComplete && _board!.curNum != _board!.maxNum ? Color(0xff0958c5) : Color(0xffd1d5d9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: !_board!.isComplete && _board!.curNum != _board!.maxNum ? [
            Text('모집 완료 시, 배달비 ${(_board!.deliveryPrice/_board!.maxNum).ceil()}원 !', style: textStyle(color: Colors.white, weight: 700),),
            Text('참여하기', style: textStyle(color: Colors.white, weight: 700)),
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
        if(!_board!.isComplete) {
          navigatorPush(context: context, widget: BoardSettingView(boardId: widget.boardId, backCallback: _getBoardInfo));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: !_board!.isComplete ? Color(0xff0958c5) : Color(0xffd1d5d9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: !_board!.isComplete ? [
            Text('관리하기', style: textStyle(color: Colors.white, weight: 700),),
          ] : [
            Text('완료된 파티입니다', style: textStyle(color: Colors.white, weight: 700))
          ]
        )
      )
    );
  }

  contentBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(_distString != null ? '${_distString!} m' : '위치를 설정해주세요', style: textStyle(color: Color(0xffa8a8a8), size: 14.0))
                    ]
                  ),
                  SizedBox(height: 6.0),
                  Text(dateFormat(_board!.time), style: textStyle(color: Color(0xffa8a8a8), size: 12.0)),
                ]
              )),
              userInfo.id != _board!.userId ? DefaultButton(
                title: '신고하기',
                callback: () {
                  navigatorPush(context: context, widget: ReportView(completeCallback: () {}, isBack: true, userName: _board!.userName,));
                },
                width: 60, height: 24, fontSize: 12.0,
              ) : DefaultButton(
                title: '삭제하기',
                callback: () {
                  _deleteBoard();
                },
                width: 60, height: 24, fontSize: 12.0,
              ),
            ]
          ),
          SizedBox(height: 12),
          Text(_board!.content, style: textStyle(), textAlign: TextAlign.left,)
        ]
      )
    );
  }

  _deleteBoard() async {
    if(_board!.isComplete) {
      showToast('완료된 파티는 3일 이내에 삭제가 불가능합니다.');
    }
    else {
      var _status = await deleteBoard(boardId: widget.boardId);
      if(_status == false) {
        showToast('네트워크를 확인해주세요');
      }
      else {
        showToast('삭제완료');
        navigatorPush(context: context, widget: MainNavView(initialIndex: 1,), replacement: true, all: true);
      }
    }
  }
}