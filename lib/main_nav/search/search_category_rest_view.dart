import 'package:delito/api/restaurant_api.dart';
import 'package:delito/component/content_title_container.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/line_divider.dart';
import 'package:delito/main_nav/search/search_view.dart';
import 'package:delito/object/category.dart';
import 'package:delito/object/restaurant.dart';
import 'package:delito/store/shop/rest_item_container.dart';
import 'package:delito/store/store_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:delito/function.dart';

class SearchCategoryRestView extends StatefulWidget {
  final int categoryId;
  SearchCategoryRestView({required this.categoryId});

  @override
  State<SearchCategoryRestView> createState() => _SearchCategoryRestView();
}
class _SearchCategoryRestView extends State<SearchCategoryRestView> with SingleTickerProviderStateMixin {

  int? _categoryId;
  late TabController _tabController;
  int _pageNum = 0;

  List<Restaurant> restList = [];
  bool isLoaded = false;
  bool isEnded = false;
  bool isExist = true;

  @override
  void initState() {
    _categoryId = widget.categoryId;
    _tabController = TabController(length: categoryList.length, vsync: this, initialIndex: _categoryId!);
    super.initState();
    _getRestList();
  }

  void _patchCategoryId(int newId) {
    setState(() {
      _pageNum = 0;
      _categoryId = newId;
      isLoaded = false;
      isEnded = false;
      restList = [];
      _getRestList();
    });
  }

  void _getRestList() async {
    var _temp = await getRestListByPage(categoryId: categoryList[_categoryId!].id, pageNum: _pageNum);
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
        restList = restList + _temp;
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
      appBar: DefaultAppBar(title: '배달 가능한 식당 찾기', back: true, elevation: 0.0,),
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
                      child: ContentTitleContainer(title: '${testRestList.length}건의 검색결과')
                    )
                  ] + (isExist ? (isLoaded ? List.generate(restList.length, (index) {
                    return RestItemContainer(context: context, shop: restList[index]);
                  }) : []) : [
                    DefaultButton(title: '가게가 없습니다.', callback: () {}, width: MediaQuery.of(context).size.width, hasBorder: false, height: 40),
                  ]) + [
                    LineDivider(),
                    DefaultButton(title: isEnded ? '모든 가게를 조회했습니다.' : '더 불러오기', callback: isEnded ? () {} : _getRestList, width: MediaQuery.of(context).size.width, hasBorder: false, height: 40),
                    LineDivider(),
                    SizedBox(height: 20),
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}