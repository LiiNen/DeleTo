import 'package:delito/api/category_api.dart';
import 'package:delito/component/default_app_bar.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/search/search_address_selection_view.dart';
import 'package:delito/main_nav/search/search_category_board_view.dart';
import 'package:delito/object/category.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchView();
}
class _SearchView extends State<SearchView> {

  String? _address;

  @override
  void initState() {
    super.initState();
    _getAddress();
  }

  _getAddress() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      _address = pref.getString('address') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: _address != null ? (_address != '' ? _address! : '주소 설정하기') : '',
        tapAction: () {
          navigatorPush(context: context, widget: SearchAddressSelectionView(completeCallback: _getAddress));
        },
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Container(
              height: 32,
              child: (_address != null && _address != '') ? Center(child: Text('위의 주소 별칭을 탭해 현재 위치를 변경할 수 있습니다.', style: textStyle(weight: 500, size: 12.0))) : Container()
            ),
            Expanded(child: Container()),
            categoryImageSelector(),
            SizedBox(height: 12),
            categorySelector(),
            SizedBox(height: 24),
            Expanded(child: Container()),
          ]
        )
      )
    );
  }

  categoryImageSelector() {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4, crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        childAspectRatio: 1.2,
        children: List.generate(definedCategory.length, (index) {
          return GestureDetector(
            onTap: () {
              navigatorPush(context: context, widget: SearchCategoryBoardView(categoryId: index));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffdad9d9), width: 1),
                image: DecorationImage(
                  image: AssetImage('asset/category-${categoryList[index].id}.png'),
                  alignment: Alignment.bottomRight,
                )
              ),
              padding: EdgeInsets.only(left: 4, top: 4),
              child: Text(categoryList[index].name, style: textStyle(weight: 700, size: 12.0))
            )
          );
        })
      )
    );
  }

  categorySelector() {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 5, crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.6,
        children: List.generate(categoryList.length-definedCategory.length, (index) {
          return GestureDetector(
            onTap: () {
              navigatorPush(context: context, widget: SearchCategoryBoardView(categoryId: definedCategory.length+index));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffdad9d9), width: 1),
              ),
              child: Center(
                child: Text(categoryList[definedCategory.length+index].name, style: textStyle(weight: 700, size: 12.0))
              )
            )
          );
        })
      )
    );
  }
}