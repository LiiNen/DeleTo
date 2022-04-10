import 'package:delito/component/confirm_dialog.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/object/shop.dart';
import 'package:delito/function.dart';
import 'package:flutter/material.dart';

class StoreBoardCreationView extends StatefulWidget {
  final Widget shopInfoWidget;
  final Shop shop;
  StoreBoardCreationView({required this.shopInfoWidget, required this.shop});
  @override
  State<StoreBoardCreationView> createState() => _StoreBoardCreationView();
}
class _StoreBoardCreationView extends State<StoreBoardCreationView> {

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode contentFocusNode = FocusNode();

  _createBoard() async {
    if(titleController.text == '') {
      showToast('제목을 입력해주세요');
      return;
    }
    else if(contentController.text == '') {
      showToast('내용을 입력해주세요');
      return;
    }
    return (await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: '${widget.shop.shopName} 배달 동료 모집을 시작하시겠습니까?',
        positiveAction: () {
          // todo: callback
          print('완료');
        },
        negativeAction: () {},
      )
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '모집글 작성하기', back: true,),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    widget.shopInfoWidget,
                    SizedBox(height: 24),
                    DefaultTextField(controller: titleController, focusNode: titleFocusNode, hint: '제목', nextFocusNode: contentFocusNode,),
                    SizedBox(height: 12),
                    DefaultTextField(controller: contentController, focusNode: contentFocusNode, hint: '내용', allowEnter: true,callback: _createBoard),
                    SizedBox(height: 96), // button + sizedBox + margin 20
                  ]
                )
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DefaultButton(title: '작성하기', callback: _createBoard, width: MediaQuery.of(context).size.width),
                    SizedBox(height: 40),
                  ]
                )
              ),
            ]
          )
        )
      )
    );
  }
}