import 'package:flutter/material.dart';

import '../../values/app_theme.dart';
import '../text/text_basic_widget.dart';

class ButtonBasicWidget extends StatelessWidget {
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
        color: AppTheme.of(context).white,
      ),
      style: ElevatedButton.styleFrom(
        primary:
            enable ? AppTheme.of(context).main50 : AppTheme.of(context).main30,
        minimumSize: isFullWidht ? const Size.fromHeight(50) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
