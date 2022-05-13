import 'package:delito/function.dart';
import 'package:delito/object/board.dart';
import 'package:delito/store/board/store_board_view.dart';
import 'package:delito/store/store_item_container.dart';
import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class BoardItemContainer extends StoreItemContainer {
  final Board board;
  final dynamic context;

  BoardItemContainer({required this.context, required this.board}) : super(
    imgUrl: board.imgUrl, subTitle: board.shopName, title: board.title, content: board.content,
    callback: () {
      navigatorPush(context: context, widget: StoreBoardView(board: board));
    },
    bottomAlignWidget: <Widget>[
      Icon(Icons.person_rounded, size: 16),
      SizedBox(width: 4),
      Text('(${board.curNum}명 / ${board.maxNum}명)', style: textStyle(weight: 600, size: 10.0)),
      SizedBox(width: 6),
      board.open ? board.curNum < board.maxNum ?
        Text('모집중', style: textStyle(color: Color(0xff0958c5), weight: 700, size: 16.0)) :
        Text('모집완료', style: textStyle(color: Colors.red, weight: 700, size: 16.0)) :
        Text('모집마감', style: textStyle(color: Colors.grey, weight: 700, size: 16.0))
    ]
  );
}