import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

import '../text/text_basic_widget.dart';

class ButtonOutlineBasicWidget extends StatelessWidget with BaseWidgetMixin {
  final String text;
  final Function onTap;
  final Size? size;
  final bool isFullWidht;
  final bool enable;

  const ButtonOutlineBasicWidget({
    Key? key,
    this.text = '',
    this.isFullWidht = false,
    this.size,
    this.enable = true,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => enable ? onTap() : {},
      child: TextBasicWidget(
        text: text,
        weight: FontWeight.w600,
        color: enable ? theme.main50 : theme.main30,
      ),
      style: ElevatedButton.styleFrom(
        shadowColor: theme.white,
        elevation: 0,
        primary: theme.white,
        minimumSize: isFullWidht
            ? const Size.fromHeight(50)
            : size == null
                ? null
                : size,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: enable ? theme.main50 : theme.main30),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
