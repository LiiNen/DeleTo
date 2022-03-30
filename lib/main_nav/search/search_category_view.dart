import 'package:deleto/component/default_app_bar.dart';
import 'package:deleto/main_nav/search/search_view.dart';
import 'package:flutter/material.dart';

class SearchCategoryView extends StatefulWidget {
  final int categoryId;
  SearchCategoryView({required this.categoryId});

  @override
  State<SearchCategoryView> createState() => _SearchCategoryView();
}
class _SearchCategoryView extends State<SearchCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: foodCategory[widget.categoryId].replaceAll('\n', ',')),
    );
  }
}