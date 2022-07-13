import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/text/text_basic_widget.dart';

class ButtonFilterSearchWidget extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final Widget icon;
  final Function onClick;

  const ButtonFilterSearchWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClick,
      style: ElevatedButton.styleFrom(
        shadowColor: theme.white,
        elevation: 0,
        minimumSize: Size(double.infinity, 65),
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: icon,
          ),
          TextBasicWidget(
            text: title,
            weight: FontWeight.w600,
            color: theme.black50,
          ),
        ],
      ),
    );
  }
}
