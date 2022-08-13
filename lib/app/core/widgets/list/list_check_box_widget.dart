import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:flutter/material.dart';

class ListCheckBox extends StatelessWidget with BaseWidgetMixin {
  final bool? value;
  final Function(bool)? onTap;
  ListCheckBox({
    Key? key,
    this.value,
    this.onTap,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
      title: TextBasicWidget(
        text: label,
        size: 14,
        weight: FontWeight.w400,
        color: theme.black50,
      ),
      value: true,
      onChanged: (value) {},
    );
  }
}
