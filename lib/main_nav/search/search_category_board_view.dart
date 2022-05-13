import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/search/search_category_shop_view.dart';
import 'package:delito/main_nav/search/search_view.dart';
import 'package:delito/object/board.dart';
import 'package:delito/store/board/board_item_container.dart';
import 'package:delito/store/store_tab_bar.dart';
import 'package:flutter/material.dart';

class SearchCategoryBoardView extends StatefulWidget {
  final int categoryId;
  SearchCategoryBoardView({required this.categoryId});

  @override
  State<SearchCategoryBoardView> createState() => _SearchCategoryBoardView();
}
class _SearchCategoryBoardView extends State<SearchCategoryBoardView> with SingleTickerProviderStateMixin {

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
      appBar: DefaultAppBar(title: '모집글 찾기', back: true, elevation: 0,),
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
                      child: ContentTitleContainer(title: '${testBoardList.length}건의 검색결과')
                    )
                  ] + List.generate(testBoardList.length*10, (index) {
                    return BoardItemContainer(context: context, board: testBoardList[index%5],);
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
}