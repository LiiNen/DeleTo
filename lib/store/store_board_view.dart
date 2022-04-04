import 'package:delito/component/confirm_dialog.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/report/report_view.dart';
import 'package:delito/object/comment.dart';
import 'package:delito/object/store.dart';
import 'package:delito/store/comment/comment_view.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class StoreBoardView extends StatefulWidget {
  final Store store;
  StoreBoardView({required this.store});
  @override
  State<StoreBoardView> createState() => _StoreBoardView();
}
class _StoreBoardView extends State<StoreBoardView> {

  _participate() async {
    return (await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: '참여하실래요?',
        positiveAction: () {},
        negativeAction: () {},
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '배달동료 구인', back: true,),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Text(widget.store.title, style: textStyle(weight: 600, size: 28.0)),
                  SizedBox(height: 24),
                  partyInfoBox(),
                  SizedBox(height: 24),
                  priceInfoBox(),
                  SizedBox(height: 24),
                  contentBox(),
                  SizedBox(height: 80),
                  CommentView(commentList: testCommentList,),
                  SizedBox(height: 20),
                ]
              )
            )
          )
        )
      )
    );
  }

  partyInfoBox() {
    return Row(
      children: [
        FlutterLogo(size: 62,),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.store.name, style: textStyle(weight: 500, size: 16.0)),
              SizedBox(height: 6),
              Text('최소주문금액 : ${widget.store.leastPrice}원', style: textStyle(size: 14.0)),
              SizedBox(height: 6),
              Text('배달비 : ${widget.store.deliveryPrice}원', style: textStyle(size: 14.0)),
            ]
          )
        )
      ]
    );
  }

  priceInfoBox() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(widget.store.open && widget.store.curNum < widget.store.maxNum) {
          _participate();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: widget.store.open ? widget.store.curNum < widget.store.maxNum ?
            Colors.lightGreenAccent : Colors.pinkAccent : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.store.open ? widget.store.curNum < widget.store.maxNum ? [
            Text('모집 완료 시, 배달비 ${(widget.store.deliveryPrice/widget.store.maxNum).ceil()}원 !', style: textStyle(weight: 700),),
            Text('참여하기', style: textStyle(weight: 700)),
          ] : [
            Text('현재 정원이 모두 모집되었습니다.', style: textStyle(weight: 700))
          ] : [
            Text('모집이 완료된 글입니다.', style: textStyle(weight: 700))
          ]
        )
      )
    );
  }

  contentBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.store.userName, style: textStyle(weight: 600)),
                  SizedBox(height: 6.0),
                  Text(widget.store.time, style: textStyle(color: Color(0xffa8a8a8), size: 12.0)),
                ]
              )),
              DefaultButton(
                title: '신고하기',
                callback: () {
                  navigatorPush(context: context, widget: ReportView(completeCallback: () {}, isBack: true, userName: widget.store.userName,));
                },
                width: 56, height: 24, fontSize: 12.0,
              )
            ]
          ),
          SizedBox(height: 12),
          Text(widget.store.content, style: textStyle())
        ]
      )
    );
  }
}