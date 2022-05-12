import 'package:delito/component/condition_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/component/warning_text.dart';
import 'package:delito/function.dart';
import 'package:delito/login/login_app_bar.dart';
import 'package:delito/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _RegisterView();
}
class _RegisterView extends State<RegisterView> {
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();
  FocusNode idFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode pwFocusNode = FocusNode();
  FocusNode pwConfirmFocusNode = FocusNode();

  bool emailConfirm = false;
  bool pwConfirm = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: LoginAppBar(),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 21),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text('계정 정보 입력하기', style: textStyle(weight: 700, size: 20.0)),
                SizedBox(height: 24),
                Text('아이디', style: textStyle(weight: 700, size: 14.0)),
                SizedBox(height: 8),
                DefaultTextField(controller: idController, focusNode: idFocusNode, hint: '아이디를 입력해주세요', nextFocusNode: emailFocusNode,),
                SizedBox(height: 20),
                Text('이메일', style: textStyle(weight: 700, size: 14.0)),
                SizedBox(height: 8),
                DefaultTextField(controller: emailController, focusNode: emailFocusNode, hint: '이메일을 입력해주세요', nextFocusNode: pwFocusNode,
                  changeListener: () {
                    setState(() {
                      emailConfirm = emailRegexCheck(emailController.text);
                    });
                  },
                ),
                SizedBox(height: 4),
                WarningText(
                  isDefault: emailController.text == '', defaultMessage: '본인 인증에 사용할 이메일 주소를 입력해주세요.',
                  isError: !emailConfirm, errorMessage: '이메일 형식이 잘못되었습니다.', successMessage: '적합한 이메일 형식입니다.'
                ),
                SizedBox(height: 24),
                Text('비밀번호', style: textStyle(weight: 700, size: 14.0)),
                DefaultTextField(
                  controller: pwController, focusNode: pwFocusNode, hint: '비밀번호를 입력해주세요', nextFocusNode: pwConfirmFocusNode,
                  changeListener: () {
                    setState(() {});
                  },
                  secureText: true,
                ),
                SizedBox(height: 4),
                WarningText(
                  isDefault: pwController.text == '', defaultMessage: '영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.',
                  isError: !pwRegexCheck(pwController.text), errorMessage: '비밀번호는 영문, 숫자를 포함하여 8자 이상이어야 합니다.', successMessage: '적합한 비밀번호 입니다.'
                ),
                SizedBox(height: 24),
                Text('비밀번호 확인', style: textStyle(weight: 700, size: 14.0)),
                SizedBox(height: 8),
                DefaultTextField(
                  controller: pwConfirmController, focusNode: pwConfirmFocusNode, hint: '비밀번호를 한번 더 입력해주세요',
                  changeListener: () {
                    setState(() {
                      pwConfirm = (pwController.text == pwConfirmController.text);
                    });
                  },
                  secureText: true,
                ),
                SizedBox(height: 4),
                WarningText(
                  isDefault: pwConfirmController.text == '', defaultMessage: '',
                  isError: !pwConfirm, errorMessage: '비밀번호가 일치하지 않습니다.', successMessage: '비밀번호가 일치합니다.'
                ),
                SizedBox(height: 36),
                ConditionButton(
                  title: '회원가입 완료하기',
                  callback: () {
                    showToast('미구현 기능입니다.');
                    navigatorPush(context: context, widget: LoginView(), replacement: true, all: true);
                  },
                  condition: emailConfirm && pwConfirm && idController.text != '',
                  width: MediaQuery.of(context).size.width-42
                ),
              ]
            )
          )
        )
      )
    );
  }
}