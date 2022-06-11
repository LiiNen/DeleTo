import 'package:delito/api/user_api.dart';
import 'package:delito/component/confirm_dialog.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/line_divider.dart';
import 'package:delito/function.dart';
import 'package:delito/login/login_view.dart';
import 'package:delito/main_nav/user/point_charge_button.dart';
import 'package:delito/main_nav/user/point_view.dart';
import 'package:delito/main_nav/user/user_column_button.dart';
import 'package:delito/object/user.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserView();
}
class _UserView extends State<UserView> {
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() async {
    var _status = await getUser(userId: userInfo.id);
    if(_status == true) {
      setState(() {});
    }
    else {
      showToast('네트워크를 확인해주세요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '내 정보'),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 24),
              _userInfoBox(),
              SizedBox(height: 24),
              _pointBox(),
              SizedBox(height: 24),
              Column(
                children: [
                  LineDivider(),
                  ContentTitleContainer(title: '계정 / 정보 관리'),
                  UserColumnButton(title: '포인트 이용내역 조회하기', callback: () {navigatorPush(context: context, widget: PointView());}),
                  UserColumnButton(title: '이메일', content: userInfo.email),
                  UserColumnButton(title: '회원정보 수정'),
                  LineDivider(),
                  ContentTitleContainer(title: '기타'),
                  UserColumnButton(title: '공지사항'),
                  UserColumnButton(title: '버전 정보 조회'),
                  UserColumnButton(title: '로그아웃', callback: _logoutAction,),
                  UserColumnButton(title: '탈퇴하기'),
                ]
              )
            ]
          )
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
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('매너점수: ', style: textStyle(weight: 500, size: 16.0)),
                  Text('${userInfo.manner}p',
                    style: textStyle(
                      color: userInfo.manner < -100 ? Color(0xffd93826) :
                        userInfo.manner < -10 ? Color(0xffff8030) :
                        userInfo.manner > 100 ? Color(0xff0958c5) :
                        userInfo.manner > 10 ? Color(0xff048833) : Color(0xffa9a9a9),
                      weight: 500, size: 16.0
                    )
                  ),
                  SizedBox(width: 8),
                  Text(userInfo.manner < -100 ? '😬' :
                    userInfo.manner < -10 ? '😡' :
                    userInfo.manner > 100 ? '😎' :
                    userInfo.manner > 10 ? '😍' : '😃', style: textStyle(size: 16.0)),
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