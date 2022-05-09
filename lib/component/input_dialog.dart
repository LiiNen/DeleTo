import 'package:flutter/material.dart';

import 'confirm_dialog.dart';

class InputDialog extends ConfirmDialog {
  final String confirmWord;

  InputDialog({required title, required confirmAction, required this.confirmWord}) : super(title: title, positiveAction: null, negativeAction: null, confirmAction: confirmAction);

  @override
  State<InputDialog> createState() => _InputDialog();
}
class _InputDialog extends State<InputDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        children: [

        ]
      )
    );
  }
}