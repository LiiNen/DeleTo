import 'package:delito/component/condition_button.dart';
import 'package:delito/component/default_view.dart';
import 'package:delito/component/line_divider.dart';
import 'package:delito/login/login_app_bar.dart';
import 'package:delito/login/register_view.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:delito/function.dart';

class PolicyView extends StatefulWidget {
  @override
  State<PolicyView> createState() => _PolicyView();
}

class _PolicyView extends State<PolicyView> {
  final List<bool> _checkList = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: LoginAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 21),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text('환영합니다', style: textStyle(weight: 700, size: 20)),
                SizedBox(height: 16),
                Text('아래 약관에 동의하시고\n'
                    '딜리투 서비스를 이용해보세요!',
                  style: textStyle(weight: 400, size: 16.0),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 52),
                LineDivider(color: Color(0xffd1d5d9)),
                SizedBox(height: 16),
                _checkBoxRow(0, '모두 동의합니다.', false, textStyle(weight: 600, size: 18.0)),
                SizedBox(height: 16),
                LineDivider(color: Color(0xffd1d5d9)),
                SizedBox(height: 16),
                _checkBoxRow(1, '(필수) 이용약관', true, textStyle(color: Color(0xff636c73), weight: 400, size: 14.0)),
                SizedBox(height: 20),
                _checkBoxRow(2, '(필수) 개인정보 수집 및 이용에 대한 안내', true, textStyle(color: Color(0xff636c73), weight: 400, size: 14.0)),
                SizedBox(height: 20),
                _checkBoxRow(3, '(필수) 위치기반 서비스 이용 약관 동의', true, textStyle(color: Color(0xff636c73), weight: 400, size: 14.0)),
              ],
            ),
            Positioned(
              bottom: 36,
              child: ConditionButton(title: '시작하기', callback: _nextStep, condition: _check(), width: MediaQuery.of(context).size.width-42),
            )
          ],
        )
      )
    );
  }

  _checkBoxRow(int index, String title, bool detailBool, TextStyle style) {
    return GestureDetector(
      onTap: () => {_checkBoxTap(index)},
      child: Container(
        height: 24,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 24, height: 24,
                  child: SvgPicture.asset(_checkList[index] ? 'asset/svg/checkBoxCheck.svg' : 'asset/svg/checkBoxUncheck.svg'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text(title, style: style,),
                ),
              ]
            ),
            GestureDetector(
              onTap: () {
                navigatorPush(context: context, widget: DefaultView(title: title));
              },
              child: Container(
                width: 24, height: 24,
                child: detailBool ? SvgPicture.asset('asset/svg/iconArrow.svg') : Container()
              )
            ),
          ],
        )
      )
    );
  }

  void _checkBoxTap(index) {
    setState(() {
      if(index == 0) {
        _checkList[0] = _checkList[1] = _checkList[2] = _checkList[3] = (_check() ? false : true);
      }
      else {
        _checkList[index] = !_checkList[index];
        if(_checkList[0] && !_checkList[index]) _checkList[0] = false;
        if(_check()) _checkList[0] = true;
      }
    });
  }

  bool _check() {
    return (_checkList[1] && _checkList[2] && _checkList[3] ? true : false);
  }

  _nextStep() {
    navigatorPush(context: context, widget: RegisterView());
  }
}