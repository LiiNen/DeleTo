import 'package:deleto/component/default_app_bar.dart';
import 'package:deleto/function.dart';
import 'package:deleto/main_nav/search/search_category_view.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '음식 카테고리 선택'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            categorySelector()
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
              navigatorPush(context: context, widget: SearchCategoryView(categoryId: index));
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