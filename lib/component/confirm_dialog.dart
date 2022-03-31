import 'package:flutter/material.dart';
import 'package:deleto/style.dart';

class ConfirmDialog extends StatefulWidget {
  final String title;
  final dynamic positiveAction;
  final dynamic negativeAction;
  final dynamic confirmAction;
  final String? positiveWord;
  final String? negativeWord;
  ConfirmDialog({required this.title, required this.positiveAction, required this.negativeAction, this.confirmAction, this.positiveWord, this.negativeWord});

  @override
  State<ConfirmDialog> createState() => _ConfirmDialog();
}
class _ConfirmDialog extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: dialogBox()
    );
  }

  dialogBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          dialogTitle(),
          dialogSelection(),
        ]
      )
    );
  }

  dialogTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22),
      height: 112,
      child: Center(
        child: Text(widget.title, style: textStyle(weight: 400, size: 16.0))
      )
    );
  }

  dialogSelection() {
    return Container(
      height: 52,
      child: Row(
        children: widget.confirmAction == null ? [
          selectionBox(widget.positiveWord == null ? '예' : widget.positiveWord!, widget.positiveAction, true),
          selectionBox(widget.negativeWord == null ? '아니요' : widget.negativeWord!, widget.negativeAction, false),
        ] : [
          selectionBox('확인', widget.confirmAction, true),
        ],
      )
    );
  }

  selectionBox(String title, dynamic action, bool isPositive) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pop(context);
          action();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffebebeb), width: 1),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
            color: Color(0xfffbfbfb),
          ),
          child: Center(
              child: Text(title, style: textStyle(color: isPositive ? Colors.black : Color(0xff707070), weight: 600, size: 14.0))
          )
        )
      )
    );
  }
}