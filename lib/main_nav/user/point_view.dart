import 'package:delito/api/point_api.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/main_nav/user/point_item_container.dart';
import 'package:delito/object/user.dart';
import 'package:flutter/material.dart';
import 'package:delito/object/point.dart';
import 'package:delito/function.dart';

class PointView extends StatefulWidget {
  @override
  State<PointView> createState() => _PointView();
}
class _PointView extends State<PointView> {

  List<Point>? pointList;

  @override
  void initState() {
    super.initState();
    _getPointList();
  }

  _getPointList() async {
    pointList = await getPointList(pageNum: 0, lastPoint: userInfo.point);
    if(pointList == null) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      setState(() {});
    }
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
          ] + (pointList != null ? List.generate(pointList!.length, (index) {
            return PointItemContainer(point: pointList![index]);
          }) : []) + [
            SizedBox(height: 20),
          ]
        )
      )
    );
  }
}