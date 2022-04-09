import 'package:delito/component/default_app_bar.dart';
import 'package:delito/object/shop.dart';
import 'package:flutter/material.dart';

class StoreShopView extends StatefulWidget {
  final Shop shop;
  StoreShopView({required this.shop});
  @override
  State<StoreShopView> createState() => _StoreShopView();
}
class _StoreShopView extends State<StoreShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: widget.shop.shopName, back: true),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),

            ]
          )
        )
      )
    );
  }
}