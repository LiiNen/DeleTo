import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/main_nav_view.dart';
import 'package:delito/object/user.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginView();
}
class _LoginView extends State<LoginView> {

  TextEditingController idController = TextEditingController();
  FocusNode idFocusNode = FocusNode();
  TextEditingController pwController = TextEditingController();
  FocusNode pwFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('DeliTo', style: textStyle(weight: 700, size: 24.0),),
                SizedBox(height: 4),
                Text('Delivery Together', style: textStyle(color: Color(0xffc9c9c9), weight: 500, size: 18.0)),
                SizedBox(height: 12),
                Text('배달팁에 대처하는 현명한 방법', style: textStyle(color: Color(0xffd5d5d5), weight: 400, size: 14.0)),
                SizedBox(height: 24),
                DefaultTextField(controller: idController, focusNode: idFocusNode, hint: 'ID', nextFocusNode: pwFocusNode,),
                SizedBox(height: 24),
                DefaultTextField(controller: pwController, focusNode: pwFocusNode, hint: 'PW', callback: loginAction),
                SizedBox(height: 30),
                DefaultButton(title: '로그인', callback: loginAction)
              ]
            )
          )
        )
      )
    );
  }
  
  loginAction() {
    try {
      var _id = int.parse(idController.text);
      if(_id >= 0 && _id < 6) {
        userInfo = testUserList[_id];
      }
    } catch(e) {
      // do nothing
    }
    showToast('안녕하세요 ${userInfo.name} 회원님!');
    navigatorPush(context: context, widget: MainNavView(), replacement: true, all: true);
  }
}