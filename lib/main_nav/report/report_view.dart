import 'package:delito/component/condition_button.dart';
import 'package:delito/component/confirm_dialog.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/function.dart';
import 'package:flutter/material.dart';

class ReportView extends StatefulWidget {
  final dynamic completeCallback;
  final bool isBack;
  final String userName;
  ReportView({required this.completeCallback, this.isBack=false, this.userName=''});
  @override
  State<ReportView> createState() => _ReportView();
}
class _ReportView extends State<ReportView> {
  TextEditingController userController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode userFocusNode = FocusNode();
  FocusNode contentFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if(widget.userName != '') {
      setState(() {
        userController.text = widget.userName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '신고하기', back: widget.isBack,),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContentTitleContainer(title: '신고 대상'),
                    DefaultTextField(controller: userController, focusNode: userFocusNode, hint: '신고할 유저 이름', nextFocusNode: contentFocusNode, enabled: widget.userName == '' ? true : false, changeListener: () {setState(() {});},),
                    ContentTitleContainer(title: '신고 내용'),
                    DefaultTextField(controller: contentController, focusNode: contentFocusNode, hint: '상세하게 작성할수록 처리하기 쉽습니다.', nextFocusNode: userFocusNode, allowEnter: true, changeListener: () {setState(() {});}),
                    ContentTitleContainer(title: '회신 받을 이메일 주소'),
                    DefaultTextField(controller: emailController, focusNode: emailFocusNode, hint: '(선택) 회신받을 이메일 주소', callback: _sendReport,),
                    SizedBox(height: 76),
                  ]
                )
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ConditionButton(title: '신고 접수', callback: _sendReport, width: MediaQuery.of(context).size.width, condition: userController.text != '' && contentController.text != '',),
                    SizedBox(height: 20),
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }

  _sendReport() async {
    if(userController.text == '') {
      showToast('신고할 대상을 기입해주세요');
      return;
    }
    else if(contentController.text == '') {
      showToast('신고 사유를 작성해주세요');
      return;
    }
    return (await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: '신고 접수하시겠습니까?\n신고 사항은 되돌릴 수 없습니다.',
        positiveAction: () {
          showToast('신고 접수가 완료되었습니다!');
          widget.completeCallback();
        },
        negativeAction: () {},
      ),
    )) ?? false;
  }
}