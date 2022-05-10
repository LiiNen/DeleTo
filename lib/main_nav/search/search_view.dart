import 'package:delito/component/default_app_bar.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/search/search_address_selection_view.dart';
import 'package:delito/main_nav/search/search_category_board_view.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> foodCategory = [
  '일식', '중식', '치킨', '백반',
  '디저트', '분식', '피자', '양식',
  '찜,탕\n찌개', '고기구이', '족발보쌈', '아시안',
  '패스트푸드', '야식', '도시락'
];

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
    print('getaddress');
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
            Text('음식 카테고리를 선택하세요'),
            SizedBox(height: 24),
            categorySelector(),
            SizedBox(height: 24),
            Expanded(child: Container()),
          ]
        )
      )
    );
  }


  categorySelector() {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4, crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.6,
        children: List.generate(foodCategory.length, (index) {
          return GestureDetector(
            onTap: () {
              navigatorPush(context: context, widget: SearchCategoryBoardView(categoryId: index));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Center(
                child: Text(foodCategory[index])
              )
            )
          );
        })
      )
    );
  }
}