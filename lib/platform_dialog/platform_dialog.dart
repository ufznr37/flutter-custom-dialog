import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/platform_dialog/android_dialog.dart';
import 'package:flutter_custom_dialog/platform_dialog/ios_dialog.dart';

class PlatformDialog {
  static Future<dynamic> show(BuildContext context) {
    if (Platform.isIOS) {
      return IOSDialog().show(context,
          content: const Text(
            "MESSAGE",
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text(
                "ok",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ]);
    } else {
      return AndroidDialog().show(context,
          content: const Text(
            "MESSAGE",
          ),
          actions: [
            TextButton(
              child: const Text(
                "ok",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () => Navigator.of(context).pop(true),
            )
          ]);
    }
  }
}
