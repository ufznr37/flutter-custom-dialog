
import 'package:flutter/widgets.dart';

abstract class BaseDialog {
  Future<dynamic> show(BuildContext context, {Widget? content, List<Widget>? actions});
}