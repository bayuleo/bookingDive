import 'package:flutter/material.dart';

import '../../base/base_widget_mixin.dart';
import '../text/text_basic_widget.dart';

class ListRadioWidget extends StatelessWidget with BaseWidgetMixin {
  const ListRadioWidget({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.label,
  }) : super(key: key);

  final String groupValue;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
      title: TextBasicWidget(
        text: label,
        size: 14,
        weight: FontWeight.w400,
        color: theme.black50,
      ),
      trailing: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          print(value);
        },
        activeColor: theme.main50,
      ),
    );
  }
}
