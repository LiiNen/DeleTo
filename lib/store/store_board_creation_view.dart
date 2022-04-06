import 'package:delito/component/default_app_bar.dart';
import 'package:flutter/material.dart';

class StoreBoardCreationView extends StatefulWidget {
  @override
  State<StoreBoardCreationView> createState() => _StoreBoardCreationView();
}
class _StoreBoardCreationView extends State<StoreBoardCreationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '모집글 작성하기', back: true,),
    );
  }
}