import 'package:delito/function.dart';
import 'package:delito/object/shop.dart';
import 'package:delito/store/shop/store_shop_view.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class StoreShopItemContainer extends StatelessWidget {
  final Shop shop;
  StoreShopItemContainer({required this.shop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        navigatorPush(context: context, widget: StoreShopView(shop: shop));
      },
      child: Container(
        width: MediaQuery.of(context).size.width, height: 72,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            thumbnailBox(),
            SizedBox(width: 12),
            infoBox(),
          ]
        )
      )
    );
  }

  thumbnailBox() {
    return Container(
      child: FlutterLogo(size: 40, )
    );
  }

  infoBox() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(shop.shopName, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 2),
          Text('${shop.leastPrice}원 / ${shop.deliveryPrice}원', overflow: TextOverflow.ellipsis, style: textStyle(color: Color(0xffe0e0e0)),)
        ]
      )
    );
  }
}