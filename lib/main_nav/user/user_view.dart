import 'package:delito/component/confirm_dialog.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/function.dart';
import 'package:delito/login_view.dart';
import 'package:delito/main_nav/user/point_charge_button.dart';
import 'package:delito/object/user.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserView();
}
class _UserView extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '내 정보'),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24),
            _userInfoBox(),
            SizedBox(height: 24),
            _pointBox(),
            Expanded(child: Container()),
            DefaultButton(title: '로그아웃', width: MediaQuery.of(context).size.width, callback: _logoutAction),
            SizedBox(height: 24),
          ]
        )
      )
    );
  }

  _userInfoBox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120, height: 120,
          child: Icon(Icons.person, size: 120),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(userInfo.name, style: textStyle(weight: 700, size: 16.0)),
                  Text(' 회원님', style: textStyle(weight: 500, size: 16.0)),
                ]
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('현재 포인트: ', style: textStyle(weight: 500, size: 16.0)),
                  Text(userInfo.point.toString(), style: textStyle(color: Color(0xffff9933), weight: 500, size: 16.0)),
                  SizedBox(width: 4),
                  Image.asset('asset/pointIcon.png', width: 16),
                ]
              )
            ]
          )
        )
      ]
    );
  }

  _pointBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: Color(0xffffe489))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('딜리투 포인트는 자유롭게 충전/출금이 가능합니다.', style: textStyle(color: Color(0xffff9933), weight: 700, size: 14.0)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 12),
              Expanded(child: PointChargeButton(isCharge: true)),
              SizedBox(width: 12),
              Expanded(child: PointChargeButton(isCharge: false)),
              SizedBox(width: 12),
            ]
          )
        ]
      )
    );
  }

  _logoutAction() async {
    return (await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: '로그아웃 하시겠습니까?',
        positiveAction: () {
          navigatorPush(context: context, widget: LoginView(), replacement: true, all: true);
        },
        negativeAction: () {},
      ),
    )) ?? false;
  }
}