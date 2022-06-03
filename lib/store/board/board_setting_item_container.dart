import 'package:delito/component/condition_button.dart';
import 'package:delito/object/party_user.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class BoardSettingItemContainer extends StatelessWidget {
  final PartyUser user;
  final dynamic callback;
  BoardSettingItemContainer({required this.user, required this.callback});

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
          user.imgUrl != '' ? Image.network(user.imgUrl, width: 80, height: 80) : FlutterLogo(size: 80),
          SizedBox(width: 8),
          textBox(),
          Expanded(child: Container()),
          ConditionButton(title: user.isChecked ? '참여중' : '수락', callback: acceptAction, condition: !user.isChecked, width: 52.0)
        ]
      )
    );
  }

  textBox() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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

  acceptAction() async {

    callback();
  }
}