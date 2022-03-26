
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/platform_dialog/base_dialog.dart';

class AndroidDialog extends BaseDialog {
  @override
  Future<dynamic> show(BuildContext context, {Widget? content, List<Widget>? actions}) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: content,
        actions: actions,
      ),
    );
  }
}