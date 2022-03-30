import 'package:deleto/component/default_button.dart';
import 'package:deleto/component/default_text_field.dart';
import 'package:deleto/function.dart';
import 'package:deleto/main_nav/main_nav_view.dart';
import 'package:flutter/material.dart';
import 'component/default_app_bar.dart';

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
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '로그인'),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextField(controller: idController, focusNode: idFocusNode, hint: 'ID', nextFocusNode: pwFocusNode,),
              SizedBox(height: 24),
              DefaultTextField(controller: pwController, focusNode: pwFocusNode, hint: 'PW', callback: loginAction),
              SizedBox(height: 30),
              DefaultButton(title: '로그인', callback: loginAction)
            ]
          )
        )
      )
    );
  }
  
  loginAction() {
    showToast('안녕하세요 회원님!');
    navigatorPush(context: context, widget: MainNavView(), replacement: true, all: true);
  }
}