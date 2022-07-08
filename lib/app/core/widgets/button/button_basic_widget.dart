import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

import '../text/text_basic_widget.dart';

class ButtonBasicWidget extends StatelessWidget with BaseWidgetMixin {
  final String text;
  final Function onTap;
  final bool isFullWidht;
  final bool enable;

  const ButtonBasicWidget({
    Key? key,
    this.text = '',
    this.isFullWidht = false,
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
        color: theme.white,
      ),
      style: ElevatedButton.styleFrom(
        shadowColor: theme.white,
        elevation: 0,
        primary: enable ? theme.main50 : theme.main30,
        minimumSize: isFullWidht ? const Size.fromHeight(50) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
