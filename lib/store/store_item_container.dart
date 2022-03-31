import 'package:deleto/function.dart';
import 'package:deleto/object/store.dart';
import 'package:deleto/store/store_board_view.dart';
import 'package:deleto/style.dart';
import 'package:flutter/material.dart';

class StoreItemContainer extends StatelessWidget {
  final Store store;
  StoreItemContainer({required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        navigatorPush(context: context, widget: StoreBoardView(store: store));
      },
      child: Container(
        width: MediaQuery.of(context).size.width, height: 72,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
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
          Text(store.title, overflow: TextOverflow.ellipsis,),
          SizedBox(height: 2),
          Text(store.name, overflow: TextOverflow.ellipsis, style: textStyle(color: Color(0xffe0e0e0)),)
        ]
      )
    );
  }

  memberBox() {
    return Container(
      width: 60, height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: store.open ? store.curNum < store.maxNum ?
          Colors.lightGreenAccent : Colors.pinkAccent : Colors.grey
      ),
      child: Center(
        child: Text('${store.curNum} / ${store.maxNum} 명')
      )
    );
  }
}