import 'package:delito/component/default_app_bar.dart';
import 'package:delito/object/shop.dart';
import 'package:delito/style.dart';
import 'package:delito/function.dart';
import 'package:flutter/material.dart';

class StoreShopView extends StatefulWidget {
  final Shop shop;
  StoreShopView({required this.shop});
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
            children: [
              SizedBox(height: 24),
              Text(widget.shop.shopName, style: textStyle(weight: 600, size: 28.0)),
              SizedBox(height: 24),
              shopInfoBox(),
              SizedBox(height: 24),
              priceInfoBox(),
              SizedBox(height: 20),
            ]
          )
        )
      )
    );
  }

  shopInfoBox() {
    return Container();
  }

  priceInfoBox() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {

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
}