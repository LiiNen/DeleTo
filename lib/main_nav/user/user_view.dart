import 'package:deleto/component/confirm_dialog.dart';
import 'package:deleto/component/default_app_bar.dart';
import 'package:deleto/component/default_button.dart';
import 'package:deleto/function.dart';
import 'package:deleto/login_view.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  @override
  State<UserView> createState() => _UserView();
}
class _UserView extends State<UserView> {
  final int _point = 3000;
  final String _userName = '딜리투';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '내 정보'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24),
            _userInfoBox(),
            Expanded(child: Container()),
            DefaultButton(title: '로그아웃', callback: _logoutAction),
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
              Text('$_userName 회원님'),
              SizedBox(height: 4),
              Text('현재 포인트: $_point')
            ]
          )
        )
      ]
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