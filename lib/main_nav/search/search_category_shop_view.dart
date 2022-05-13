import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/main_nav/search/search_view.dart';
import 'package:delito/object/shop.dart';
import 'package:delito/store/shop/shop_item_container.dart';
import 'package:delito/store/store_tab_bar.dart';
import 'package:flutter/material.dart';

class SearchCategoryShopView extends StatefulWidget {
  final int categoryId;
  SearchCategoryShopView({required this.categoryId});

  @override
  State<SearchCategoryShopView> createState() => _SearchCategoryShopView();
}
class _SearchCategoryShopView extends State<SearchCategoryShopView> with SingleTickerProviderStateMixin {

  int? _categoryId;
  late TabController _tabController;

  @override
  void initState() {
    _categoryId = widget.categoryId;
    _tabController = TabController(length: foodCategory.length, vsync: this, initialIndex: _categoryId!);
    super.initState();
  }

  void _patchCategoryId(int newId) {
    setState(() {
      _categoryId = newId;
      _getShopList();
    });
  }

  void _getShopList() {
    /// todo: get shop list with category id
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '배달 가능한 식당 찾기', back: true, elevation: 0.0,),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            StoreTabBar(tabList: foodCategory, callback: _patchCategoryId, controller: _tabController),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: ContentTitleContainer(title: '${testShopList.length}건의 검색결과')
                    )
                  ] + List.generate(testShopList.length*10, (index) {
                    return ShopItemContainer(context: context, shop: testShopList[index%5]);
                  })
                )
              )
            )
          ]
        )
      )
    );
  }
}