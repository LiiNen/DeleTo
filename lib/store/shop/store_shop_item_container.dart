import 'package:delito/object/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreShopItemContainer extends StatelessWidget {
  final Shop shop;
  StoreShopItemContainer({required this.shop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        
      }
    );
  }
}