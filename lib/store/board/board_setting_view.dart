import 'package:delito/component/default_app_bar.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class BoardSettingView extends StatefulWidget {
  final int boardId;
  final dynamic backCallback;
  BoardSettingView({required this.boardId, required this.backCallback});

  @override
  State<BoardSettingView> createState() => _BoardSettingView();
}
class _BoardSettingView extends State<BoardSettingView> {
  var userList = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '파티원 관리', back: true, backCallback: () {widget.backCallback();},),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [

            ]
          )
        )
      )
    );
  }

  mainButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff0958c5)
        ),
        child: Center(
          child: Text('dd', style: textStyle(color: Colors.white, weight: 700))
        )
      )
    );
  }
}