import 'package:delito/function.dart';
import 'package:delito/object/restaurant.dart';
import 'package:delito/store/shop/store_rest_view.dart';
import 'package:flutter/material.dart';
import 'package:delito/store/store_item_container.dart';
import 'package:delito/style.dart';

class RestItemContainer extends StoreItemContainer {
  final Restaurant shop;
  final dynamic context;
  RestItemContainer({required this.context, required this.shop}) : super(
    imgUrl: shop.imgUrl, subTitle: shop.categories, title: shop.shopName,
    content: '최소주문금액: ${shop.leastPrice}\n배달비: ${shop.deliveryPrice}',
    callback: () {
      navigatorPush(context: context, widget: StoreRestView(restId: shop.id));
    },
    bottomAlignWidget: [
      getTimeSafe(openTime: shop.openTime, closeTime: shop.closeTime) ?
        Text('영업중', style: textStyle(color: Color(0xff0958c5), weight: 700, size: 16.0)) :
        Text('마감', style: textStyle(color: Colors.grey, weight: 700, size: 16.0))
    ]
  );
}