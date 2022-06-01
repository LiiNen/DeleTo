import 'package:delito/api/board_api.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/line_divider.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/search/search_category_rest_view.dart';
import 'package:delito/main_nav/search/search_view.dart';
import 'package:delito/object/board.dart';
import 'package:delito/object/category.dart';
import 'package:delito/store/board/board_item_container.dart';
import 'package:delito/store/store_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class SearchCategoryBoardView extends StatefulWidget {
  final int categoryId;
  SearchCategoryBoardView({required this.categoryId});

  @override
  State<SearchCategoryBoardView> createState() => _SearchCategoryBoardView();
}
class _SearchCategoryBoardView extends State<SearchCategoryBoardView> with SingleTickerProviderStateMixin {

  int? _categoryId;
  late TabController _tabController;
  int _pageNum = 0;

  List<Board> boardList = [];
  bool isLoaded = false;
  bool isEnded = false;
  bool isExist = true;

  @override
  void initState() {
    _categoryId = widget.categoryId;
    _tabController = TabController(length: categoryList.length, vsync: this, initialIndex: _categoryId!);
    super.initState();
    _getBoardList();
  }

  void _patchCategoryId(int newId) {
    setState(() {
      _pageNum = 0;
      _categoryId = newId;
      isLoaded = false;
      isEnded = false;
      boardList = [];
      _getBoardList();
    });
  }

  void _getBoardList() async {
    var _temp = await getBoardListByPage(categoryId: categoryList[_categoryId!].id, pageNum: _pageNum);
    if(_temp == null) {
      showToast('네트워크를 확인해주세요');
    }
    else {
      if(_temp.length == 0) {
        setState(() {
          if(!isLoaded && !isEnded) {
            isExist = false;
          }
          else {
            isEnded = true;
          }
        });
      }
      else {
        boardList = boardList + _temp;
        setState(() {
          isLoaded = true;
          _pageNum += 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '모집글 찾기', back: true, elevation: 0,),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            StoreTabBar(tabList: categoryList, callback: _patchCategoryId, controller: _tabController),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18),
                      child: ContentTitleContainer(title: '${testBoardList.length}건의 검색결과')
                    )
                  ] + (isExist ? (isLoaded ? List.generate(boardList.length, (index) {
                    return BoardItemContainer(context: context, board: boardList[index]);
                  }) : []) : [
                    DefaultButton(title: '가게가 없습니다.', callback: () {}, width: MediaQuery.of(context).size.width, hasBorder: false, height: 40),
                  ]) + [
                    LineDivider(),
                    DefaultButton(title: '더 불러오기', callback: _getBoardList, width: MediaQuery.of(context).size.width, hasBorder: false, height: 40),
                    LineDivider(),
                    SizedBox(height: 80),
                  ]
                )
              )
            )
          ]
        )
      ),
      floatingActionButton: Container(
        height: 40,
        child: FloatingActionButton.extended(
          onPressed: () {
            navigatorPush(context: context, widget: SearchCategoryRestView(categoryId: _categoryId!));
          },
          backgroundColor: Color(0xff0958c5),
          icon: Icon(Icons.add_outlined),
          label: Text('직접 만들기', style: textStyle(color: Colors.white, weight: 600, size: 16.0)),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}