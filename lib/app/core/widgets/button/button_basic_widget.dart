import 'package:flutter/material.dart';

import '../../values/app_theme.dart';
import '../text/text_basic_widget.dart';

class ButtonBasicWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isFullWidht;

  const ButtonBasicWidget({
    Key? key,
    this.text = '',
    this.isFullWidht = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      child: TextBasicWidget(
        text: text,
        weight: FontWeight.w600,
        color: AppTheme.of(context).white,
      ),
      style: ElevatedButton.styleFrom(
        primary: AppTheme.of(context).main50,
        minimumSize: isFullWidht ? const Size.fromHeight(50) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
