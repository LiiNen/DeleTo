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

}