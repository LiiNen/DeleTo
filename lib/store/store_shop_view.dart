import 'package:delito/component/default_app_bar.dart';
import 'package:delito/object/shop.dart';
import 'package:flutter/material.dart';

class StoreShopView extends StatefulWidget {
  final Shop store;
  StoreShopView({required this.store});
  @override
  State<StoreShopView> createState() => _StoreShopView();
}
class _StoreShopView extends State<StoreShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '', back: true),

    );
  }
}