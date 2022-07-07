import 'package:flutter/material.dart';

import '../../values/app_theme.dart';

class TextBasicWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const TextBasicWidget({
    Key? key,
    this.text = '',
    this.color,
    this.size = 14,
    this.weight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color == null ? AppTheme.of(context).black50 : color,
        fontSize: size,
        fontWeight: weight == null ? FontWeight.normal : weight,
      ),
    );
  }
}
