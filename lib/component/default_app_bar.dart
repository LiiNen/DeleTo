import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final bool back;
  final dynamic backCallback;
  final Color color;
  DefaultAppBar({required this.title, this.back=false, this.backCallback, this.color=Colors.black}) : preferredSize = Size.fromHeight(44.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: color,
      automaticallyImplyLeading: false,
      title: Container(
        child: Row(
          children: [
            Text(title)
          ]
        )
      )
    );
  }
}