import 'package:delito/function.dart';
import 'package:delito/object/board.dart';
import 'package:delito/store/board/store_board_view.dart';
import 'package:delito/style.dart';
import 'package:flutter/material.dart';

class StoreBoardItemContainer extends StatelessWidget {
  final Board board;
  StoreBoardItemContainer({required this.board});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        navigatorPush(context: context, widget: StoreBoardView(board: board));
      },
      child: Container(
        width: MediaQuery.of(context).size.width, height: 72,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: <Widget>[
            thumbnailBox(),
            SizedBox(width: 12),
            infoBox(),
            SizedBox(width: 12),
            memberBox(),
          ]
        )
      )
    );
  }

  thumbnailBox() {
    return Container(
      child: FlutterLogo(size: 40,)
    );
  }

  infoBox() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(board.title, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 2),
          Text(board.shopName, overflow: TextOverflow.ellipsis, style: textStyle(color: Color(0xffe0e0e0)),)
        ]
      )
    );
  }

  memberBox() {
    return Container(
      width: 60, height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: board.open ? board.curNum < board.maxNum ?
          Colors.lightGreenAccent : Colors.pinkAccent : Colors.grey
      ),
      child: Center(
        child: Text('${board.curNum} / ${board.maxNum} 명')
      )
    );
  }
}