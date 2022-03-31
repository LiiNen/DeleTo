import 'package:delito/component/default_app_bar.dart';
import 'package:delito/main_nav/search/search_view.dart';
import 'package:delito/object/store.dart';
import 'package:delito/store/store_item_container.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class SearchCategoryView extends StatefulWidget {
  final int categoryId;
  SearchCategoryView({required this.categoryId});

  @override
  State<SearchCategoryView> createState() => _SearchCategoryView();
}
class _SearchCategoryView extends State<SearchCategoryView> {

  int? _categoryId;

  @override
  void initState() {
    _categoryId = widget.categoryId;
    super.initState();
  }

  void _patchCategoryId(int newId) {
    setState(() {
      _categoryId = newId;
    });
  }

  void _getShopList() {
    /// todo: get shop list with category id
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '모집글 찾기', back: true,),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              switchCategoryBox()
            ] + List.generate(testStoreList.length*10, (index) {
              return StoreItemContainer(store: testStoreList[index%5],);
            })
          )
        )
      )
    );
  }

  switchCategoryBox() {
    return Container(
      width: MediaQuery.of(context).size.width, height: 82,
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          switchButton(true),
          Expanded(
            child: Center(
              child: Text(foodCategory[_categoryId!].replaceAll('\n', ','), style: textStyle(weight: 700, size: 22.0))
            )
          ),
          switchButton(false)
        ]
      )
    );
  }

  switchButton(bool isLeft) {
    int dx = isLeft ? -1 : 1;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _patchCategoryId((_categoryId! + dx) % foodCategory.length);
      },
      child: Container(
        width: 32, height: 32,
        child: Icon(isLeft ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios_rounded, size: 32),
      )
    );
  }
}