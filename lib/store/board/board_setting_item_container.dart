import 'package:delito/api/party_api.dart';
import 'package:delito/component/condition_button.dart';
import 'package:delito/component/confirm_dialog.dart';
import 'package:delito/object/party_user.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

import '../../function.dart';

class BoardSettingItemContainer extends StatelessWidget {
  final context;
  final PartyUser user;
  final dynamic callback;
  BoardSettingItemContainer({required this.context, required this.user, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 96,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xffe3e3e3), width: 1))
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textBox(),
          Expanded(child: Container()),
          ConditionButton(title: user.isChecked ? '참여중' : '수락', callback: _partyAction, condition: !user.isChecked, width: 52.0)
        ]
      )
    );
  }

  textBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(user.name, style: textStyle(weight: 700, size: 16.0)),
            SizedBox(width: 12),
            Text('${user.point} P', style: textStyle(weight: 600, size: 14.0)),
          ]
        ),
        SizedBox(height: 12),
        Text(user.content, style: textStyle(weight: 500, size: 12.0)),
      ]
    );
  }

  _partyAction() async {
    return (await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: '${user.name}님을 어떻게 하시겠습니까?',
        positiveWord: '수락',
        positiveAction: () {
          _acceptAction();
        },
        negativeWord: '거절',
        negativeAction: () {
          _rejectAction();
        },
      ),
    )) ?? false;
  }

  _acceptAction() async {
    var _status = await acceptParty(partyId: user.partyId);
    if(_status == false) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      callback();
    }
  }

  _rejectAction() async {
    var _status = await rejectParty(partyId: user.partyId);
    if(_status == false) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      callback();
    }
  }
}