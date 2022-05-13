import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/line_divider.dart';
import 'package:delito/object/menu.dart';
import 'package:delito/object/shop.dart';
import 'package:delito/store/store_board_creation_view.dart';
import 'package:delito/style.dart';
import 'package:delito/function.dart';
import 'package:flutter/material.dart';

class StoreShopView extends StatefulWidget {
  final Shop shop;
  final bool fromBoard;
  StoreShopView({required this.shop, this.fromBoard=false});
  @override
  State<StoreShopView> createState() => _StoreShopView();
}
class _StoreShopView extends State<StoreShopView> {

  bool? _isOpen;

  @override
  void initState() {
    _isOpen = getTimeSafe(openTime: widget.shop.openTime, closeTime: widget.shop.closeTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '가게정보', back: true),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Text(widget.shop.shopName, style: textStyle(weight: 600, size: 28.0)),
              SizedBox(height: 24),
              shopInfoBox(),
              SizedBox(height: 24),

              // from board just info
              !widget.fromBoard ? Column(
                children: [
                  priceInfoBox(),
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
                  Text('${widget.shop.reviewAverage}', style: textStyle(weight: 500, size: 16.0)),
                ]
              ),
              LineDivider(),
              // menu list if exists
              widget.shop.menuList.length != 0 ? Column(
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
                  Text(widget.shop.deliveryTime),
                ]
              ),
              LineDivider(),
              Row(
                children: [
                  Expanded(child: ContentTitleContainer(title: '나와의 거리')),
                  SizedBox(width: 12),
                  /// todo: cal distance
                  Text('400.0m'),
                ]
              ),
              LineDivider(),
              Row(
                children: [
                  Expanded(child: ContentTitleContainer(title: '전화번호')),
                  SizedBox(width: 12),
                  Text(widget.shop.phone),
                ]
              ),
              LineDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentTitleContainer(title: '가게 주소'),
                  SizedBox(width: 12),
                  Text(widget.shop.address, textAlign: TextAlign.start,),
                  SizedBox(height: 16),
                ]
              ),

              SizedBox(height: 40),
            ]
          )
        )
      )
    );
  }

  shopInfoBox() {
    return Row(
      children: [
        widget.shop.imgSrc != '' ? Image.network(widget.shop.imgSrc, width: 62, height: 62) : FlutterLogo(size: 62,),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('최소주문금액 : ${widget.shop.leastPrice}원', style: textStyle(size: 14.0)),
              SizedBox(height: 6),
              Text('배달비 : ${widget.shop.deliveryPrice}원', style: textStyle(size: 14.0)),
              SizedBox(height: 6),
              Text('영업시간 : ${widget.shop.openTime} - ${widget.shop.closeTime}', style: textStyle(size: 14.0)),
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
        if(_isOpen!) {
          navigatorPush(context: context, widget: StoreBoardCreationView(shopInfoWidget: shopInfoBox(), shop: widget.shop));
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: BoxDecoration(
          color: _isOpen! ? Colors.lightGreenAccent : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: _isOpen!
            ? Text('모집글 만들기', style: textStyle(weight: 700))
            : Text('영업시간이 아닙니다.', style: textStyle(weight: 700))
        )
      )
    );
  }

  menuListContainer() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.shop.menuList.length*2+1,
        itemBuilder: (BuildContext context, int index) {
          // if(index==0) return SizedBox(width: 0);
          if(index%2 == 1) return menuContainer(widget.shop.menuList[((index-1)/2).floor()]);
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