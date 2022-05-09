import 'package:delito/component/default_text_field.dart';
import 'package:delito/function.dart';
import 'package:delito/object/user.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

import 'confirm_dialog.dart';

class InputDialog extends ConfirmDialog {
  final String confirmWord;

  InputDialog({required title, required confirmAction, required this.confirmWord}) : super(title: title, positiveAction: null, negativeAction: null, confirmAction: confirmAction);

  @override
  State<InputDialog> createState() => _InputDialog();
}
class _InputDialog extends State<InputDialog> {
  TextEditingController messageController = TextEditingController();
  TextEditingController pointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              descriptionBox(),
              inputTextFieldColumn(),
              confirmBox()
            ]
          )
        )
      )
    );
  }

  descriptionBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Center(child: Text('모임장에게 전달할 메세지와\n지불할 포인트를 입력해주세요', style: textStyle(weight: 600, size: 14.0), textAlign: TextAlign.center,)),
    );
  }

  inputTextFieldColumn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DefaultTextField(controller: messageController, focusNode: FocusNode(), hint: '전달할 메세지를 적어주세요'),
          SizedBox(height: 6),
          DefaultTextField(controller: pointController, focusNode: FocusNode(), hint: '사용할 포인트를 입력해주세요', isNumber: true),
        ]
      )
    );
  }

  confirmBox() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(messageController.text == '') {
          showToast('메세지를 입력해주세요');
          return;
        }
        else if(messageController.text.length > 50) {
          showToast('메세지가 너무 깁니다');
          return;
        }
        else if(pointController.text == '') {
          showToast('1 이상의 포인트를 입력해주세요');
          return;
        }
        else if(int.parse(pointController.text) > userInfo.point) {
          showToast('보유한 포인트 이내에서 입력해주세요\n보유 포인트: ${userInfo.point}P');
          return;
        }
        else {
          Navigator.pop(context);
          widget.confirmAction(messageController.text, pointController.text);
        }
      },
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffebebeb), width: 1),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
          color: Color(0xfffbfbfb),
        ),
        child: Center(
          child: Text(widget.confirmWord, style: textStyle(color: Colors.black, weight: 600, size: 14.0))
        )
      )
    );
  }
}