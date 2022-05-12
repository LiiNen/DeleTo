import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class StoreTabBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic tabList;
  final dynamic callback;
  @override
  final Size preferredSize;
  final TabController controller;
  StoreTabBar({required this.tabList, required this.callback, required this.controller}) : preferredSize = Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffededed), width: 1)
        ),
        color: Colors.white
      ),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: Colors.black),
          insets: EdgeInsets.symmetric(horizontal: 10),
        ),
        labelColor: Colors.black, unselectedLabelColor: Color(0xff8e8e8e),
        labelStyle: textStyle(color: Colors.black, weight: 700, size: 16.0),
        unselectedLabelStyle: textStyle(color: Color(0xff8e8e8e), weight: 500, size: 16.0),
        tabs: List.generate(tabList.length, (index) {
          return Tab(text: tabList[index].replaceAll('\n', ' '),);
        }),
        onTap: (index) {
          callback(index);
        },
      )
    );
  }
}