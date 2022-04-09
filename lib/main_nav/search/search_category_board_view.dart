import 'package:delito/component/default_app_bar.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/search/search_category_shop_view.dart';
import 'package:delito/main_nav/search/search_view.dart';
import 'package:delito/object/board.dart';
import 'package:delito/store/board/store_board_item_container.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class SearchCategoryBoardView extends StatefulWidget {
  final int categoryId;
  SearchCategoryBoardView({required this.categoryId});

  @override
  State<SearchCategoryBoardView> createState() => _SearchCategoryBoardView();
}
class _SearchCategoryBoardView extends State<SearchCategoryBoardView> {

  int? _categoryId;

  @override
  void initState() {
    _categoryId = widget.categoryId;
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
      appBar: DefaultAppBar(title: '모집글 찾기', back: true,),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            switchCategoryBox(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                  ] + List.generate(testBoardList.length*10, (index) {
                    return StoreBoardItemContainer(board: testBoardList[index%5],);
                  })
                )
              )
            )
          ]
        )
      ),
      floatingActionButton: Container(
        width: 48, height: 48,
        child: FloatingActionButton(
          onPressed: () {
            navigatorPush(context: context, widget: SearchCategoryShopView(categoryId: _categoryId!));
          },
          backgroundColor: Color(0xff0958c5),
          child: Icon(Icons.add_outlined)
        )
      ),
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