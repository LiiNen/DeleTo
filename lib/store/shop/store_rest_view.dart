import 'package:delito/api/restaurant_api.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/line_divider.dart';
import 'package:delito/object/menu.dart';
import 'package:delito/object/restaurant.dart';
import 'package:delito/store/store_board_creation_view.dart';
import 'package:delito/style.dart';
import 'package:delito/function.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreRestView extends StatefulWidget {
  final int restId;
  final bool fromBoard;
  StoreRestView({required this.restId, this.fromBoard=false});
  @override
  State<StoreRestView> createState() => _StoreRestView();
}
class _StoreRestView extends State<StoreRestView> {

  bool? _isOpen;
  String? _distString;

  Restaurant? _rest;

  @override
  void initState() {
    _getRestInfo();
    super.initState();
  }

  void _getRestInfo() async {
    _rest = await getRestDetail(restId: widget.restId);
    setState(() {});
    if(_rest == null) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      _isOpen = getTimeSafe(openTime: _rest!.openTime, closeTime: _rest!.closeTime);
      _calDist();
    }
  }

  _calDist() async {
    final pref = await SharedPreferences.getInstance();
    var lat = pref.getDouble('lat') ?? 0.0;
    var lng = pref.getDouble('lng') ?? 0.0;
    setState(() {
      if(lat == 0.0 && lng == 0.0) {
        _distString = '위치를 설정해주세요';
      }
      else {
        _distString = calDist(lat1: lat, lng1: lng, lat2: _rest!.lat, lng2: _rest!.lng);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '가게정보', back: true),
      backgroundColor: Colors.white,
      body: _rest != null ? Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Text(_rest!.shopName, style: textStyle(weight: 600, size: 28.0)),
              SizedBox(height: 24),
              shopInfoBox(),
              SizedBox(height: 24),

              // from board just info
              !widget.fromBoard ? Column(
                children: [
                  creationButton(),
                  SizedBox(height: 20),
                ]
              ) : Container(),
              LineDivider(),

              Row(
                children: [
                  Expanded(child: ContentTitleContainer(title: '요기요 평점')),
                  SizedBox(width: 12),
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  SizedBox(width: 2),
                  Text('${_rest!.reviewAverage}', style: textStyle(weight: 500, size: 16.0)),
                ]
              ),
              LineDivider(),
              // menu list if exists
              _rest!.menuList.length != 0 ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentTitleContainer(title: '대표 메뉴'),
                  menuListContainer(),
                  LineDivider(),
                ]
              ) : Container(),

              Row(
                children: [
                  Expanded(child: ContentTitleContainer(title: '배달 예상 시간')),
                  SizedBox(width: 12),
                  Text(_rest!.deliveryTime),
                ]
              ),
              LineDivider(),
              Row(
                children: [
                  Expanded(child: ContentTitleContainer(title: '나와의 거리')),
                  SizedBox(width: 12),
                  Text(_distString != null ? '${_distString!} m' : ''),
                ]
              ),
              LineDivider(),
              Row(
                children: [
                  Expanded(child: ContentTitleContainer(title: '전화번호')),
                  SizedBox(width: 12),
                  Text(_rest!.phone),
                ]
              ),
              LineDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentTitleContainer(title: '가게 주소'),
                  SizedBox(width: 12),
                  Text(_rest!.address, textAlign: TextAlign.start,),
                  SizedBox(height: 16),
                ]
              ),

              SizedBox(height: 40),
            ]
          )
        )
      ) : Center(child: CircularProgressIndicator())
    );
  }

  shopInfoBox() {
    return Row(
      children: [
        _rest!.imgUrl != '' ? Image.network(_rest!.imgUrl, width: 62, height: 62) : FlutterLogo(size: 62,),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('최소주문금액 : ${_rest!.leastPrice}원', style: textStyle(size: 14.0)),
              SizedBox(height: 6),
              Text('배달비 : ${_rest!.deliveryPrice}원', style: textStyle(size: 14.0)),
              SizedBox(height: 6),
              Text('영업시간 : ${_rest!.openTime} - ${_rest!.closeTime}', style: textStyle(size: 14.0)),
            ]
          )
        )
      ]
    );
  }

  creationButton() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if(_isOpen!) {
          navigatorPush(context: context, widget: StoreBoardCreationView(shopInfoWidget: shopInfoBox(), shop: _rest!));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: _isOpen! ? Color(0xff0958c5) : Color(0xffd1d5d9),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: _isOpen!
            ? Text('모집글 만들기', style: textStyle(color: Colors.white, weight: 700))
            : Text('영업시간이 아닙니다.', style: textStyle(color: Colors.white, weight: 700))
        )
      )
    );
  }

  menuListContainer() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _rest!.menuList.length*2+1,
        itemBuilder: (BuildContext context, int index) {
          // if(index==0) return SizedBox(width: 0);
          if(index%2 == 1) return menuContainer(_rest!.menuList[((index-1)/2).floor()]);
          else return Container(width: 12);
        }
      )
    );
  }

  menuContainer(Menu _menu) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120, height: 120,
          child: _menu.imgUrl != '' ? Image.network(_menu.imgUrl, width: 120, height: 120) : FlutterLogo(size: 120,)
        ),
        SizedBox(height: 4),
        Text(_menu.name, style: textStyle(weight: 700, size: 14.0)),
        SizedBox(height: 4),
        Text('${_menu.price}원', style: textStyle(color: Color(0xff7a7a7a), weight: 500, size: 14.0)),
      ]
    );
  }
}