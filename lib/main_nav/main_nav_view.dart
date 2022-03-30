import 'package:deleto/main_nav/gather/gather_view.dart';
import 'package:deleto/main_nav/report/report_view.dart';
import 'package:deleto/main_nav/search/search_view.dart';
import 'package:deleto/main_nav/user/user_view.dart';
import 'package:flutter/material.dart';
import 'package:deleto/function.dart';

class MainNavView extends StatefulWidget {
  final int initialIndex;
  MainNavView({this.initialIndex=0});
  @override
  State<MainNavView> createState() => _MainNavView();
}
class _MainNavView extends State<MainNavView> {
  int _selectedIndex=0;
  List<Widget> _navItemList = <Widget>[];

  @override
  void initState() {
    super.initState();
    _navItemList = <Widget>[
      SearchView(),
      GatherView(mainCallback: navMainForced,),
      ReportView(mainCallback: navMainForced,),
      UserView(),
    ];
    _selectedIndex = widget.initialIndex;
  }

  navMainForced() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _navItemList.elementAt(_selectedIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Color(0xffd4d4d4),
          selectedItemColor: Color(0xff3c354d),
          iconSize: 28,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(label: '음식점 찾기', icon: Icon(Icons.food_bank_outlined)),
            BottomNavigationBarItem(label: '내 모집 현황', icon: Icon(Icons.people_outline_rounded)),
            BottomNavigationBarItem(label: '신고하기', icon: Icon(Icons.assistant_photo_outlined)),
            BottomNavigationBarItem(label: '내 정보', icon: Icon(Icons.person_outline)),
          ]
        ),
      ),
    );
  }
}