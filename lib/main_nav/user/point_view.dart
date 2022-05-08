import 'package:delito/component/default_app_bar.dart';
import 'package:delito/main_nav/user/point_item_container.dart';
import 'package:delito/object/user.dart';
import 'package:flutter/material.dart';
import 'package:delito/object/point.dart';

class PointView extends StatefulWidget {
  @override
  State<PointView> createState() => _PointView();
}
class _PointView extends State<PointView> {

  dynamic _pointList;

  @override
  void initState() {
    super.initState();
    _pointList = testPointList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(title: '포인트 이용 내역', back: true,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text('현재 포인트 잔액 ${userInfo.point}')
          ] + (_pointList != null ? List.generate(_pointList.length, (index) {
            return PointItemContainer(point: _pointList[index]);
          }) : []) + [
            SizedBox(height: 20),
          ]
        )
      )
    );
  }
}