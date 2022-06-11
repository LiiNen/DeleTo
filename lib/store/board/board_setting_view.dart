import 'package:delito/api/party_api.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/main_nav_view.dart';
import 'package:delito/object/party_user.dart';
import 'package:delito/store/board/board_setting_item_container.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class BoardSettingView extends StatefulWidget {
  final int boardId;
  final dynamic backCallback;
  BoardSettingView({required this.boardId, required this.backCallback});

  @override
  State<BoardSettingView> createState() => _BoardSettingView();
}
class _BoardSettingView extends State<BoardSettingView> {
  List<PartyUser>? _userList;

  @override
  void initState() {
    _getPartyList();
    super.initState();
  }

  _getPartyList() async {
    var _temp = await getPartyList(boardId: widget.boardId);
    if(_temp != null) {
      setState(() {
        _userList = _temp;
      });
    }
    else {
      showToast('네트워크를 확인해주세요');
    }
  }

  _boardCompleteAction() async {
    var _status = await completeParty(boardId: widget.boardId);
    if(_status == false) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      showToast('완료되었습니다!');
      navigatorPush(context: context, widget: MainNavView(initialIndex: 1,), replacement: true, all: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '파티원 관리', back: true, backCallback: () {widget.backCallback();},),
      body: _userList != null ? Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            ] + (_userList!.length != 0 ? List.generate(_userList!.length, (index) {
              return BoardSettingItemContainer(context: context, user: _userList![index], callback: _getPartyList);
            }) : []) + [
              SizedBox(height: 20),
              mainButton(),
              SizedBox(height: 40),
            ]
          )
        )
      ) : Center(child: CircularProgressIndicator())
    );
  }

  mainButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _boardCompleteAction();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff0958c5)
        ),
        child: Center(
          child: Text('마감하기', style: textStyle(color: Colors.white, weight: 700))
        )
      )
    );
  }
}