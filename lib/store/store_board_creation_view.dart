import 'package:delito/api/board_api.dart';
import 'package:delito/component/condition_button.dart';
import 'package:delito/component/confirm_dialog.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/object/restaurant.dart';
import 'package:delito/function.dart';
import 'package:delito/object/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreBoardCreationView extends StatefulWidget {
  final Widget shopInfoWidget;
  final Restaurant shop;
  StoreBoardCreationView({required this.shopInfoWidget, required this.shop});
  @override
  State<StoreBoardCreationView> createState() => _StoreBoardCreationView();
}
class _StoreBoardCreationView extends State<StoreBoardCreationView> {

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController countController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode contentFocusNode = FocusNode();
  FocusNode countFocusNode = FocusNode();

  _createBoard() async {
    if(titleController.text == '') {
      showToast('제목을 입력해주세요');
      return;
    }
    else if(countController.text == '') {
      showToast('모집 인원 수를 입력해주세요');
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
        positiveAction: () async {
          final _pref = await SharedPreferences.getInstance();
          var _lat = _pref.getDouble('lat');
          var _lng = _pref.getDouble('lng');
          var _status = await postBoard(
            deliveryPrice: 1000,
            title: titleController.text,
            content: contentController.text,
            maxNum: countController.text,
            restId: 10,
            userId: userInfo.id,
            categoryId: 1,
            lat: _lat, lng: _lng
          );
          if(_status) {
            showToast('성공');
          }
          else {
            showToast('실패');
          }
        },
        negativeAction: () {},
      )
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {FocusManager.instance.primaryFocus?.unfocus();},
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
                    DefaultTextField(controller: titleController, focusNode: titleFocusNode, hint: '제목', nextFocusNode: countFocusNode, changeListener: () {setState(() {});}),
                    SizedBox(height: 12),
                    DefaultTextField(controller: countController, focusNode: countFocusNode, hint: '모집 인원 수', nextFocusNode: contentFocusNode, changeListener: () {setState(() {});}, isNumber: true,),
                    SizedBox(height: 12),
                    DefaultTextField(controller: contentController, focusNode: contentFocusNode, hint: '내용', allowEnter: true, callback: _createBoard, changeListener: () {setState(() {});}),
                    SizedBox(height: 64), // button + sizedBox + margin 20
                  ]
                )
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ConditionButton(title: '작성하기', callback: _createBoard, width: MediaQuery.of(context).size.width, condition: titleController.text != '' && contentController.text != '' && countController.text != ''),
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