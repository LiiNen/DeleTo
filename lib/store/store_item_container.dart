import 'package:flutter/material.dart';
import 'package:delito/style.dart';

class StoreItemContainer extends StatelessWidget {
  final String imgUrl;
  final String subTitle;
  final String title;
  final String content;
  final dynamic callback;
  final List<Widget> bottomAlignWidget;
  StoreItemContainer({required this.imgUrl, required this.subTitle, required this.title, required this.content, required this.callback, required this.bottomAlignWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        callback();
      },
      child: Container(
        width: MediaQuery.of(context).size.width, height: 124,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xffe3e3e3), width: 1))
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            imgUrl != '' ? Image.network(imgUrl, width: 100, height: 100) : FlutterLogo(size: 100),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subTitle, style: textStyle(color: Color(0xff8a8a8a), weight: 400, size: 10.0), overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 6),
                      Text(title, style: textStyle(color: Colors.black, weight: 700, size: 14.0), overflow: TextOverflow.fade,),
                      SizedBox(height: 4),
                      Text(content, style: textStyle(color: Colors.black, weight: 400, size: 10.0), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: bottomAlignWidget
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}