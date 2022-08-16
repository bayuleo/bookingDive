import 'package:flutter/material.dart';

import '../../values/app_theme.dart';

class TextBasicWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final int? maxLine;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;

  const TextBasicWidget({
    Key? key,
    this.text = '',
    this.color,
    this.size = 14,
    this.maxLine,
    this.weight,
    this.textAlign,
    this.textDecoration,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        color: color == null ? AppTheme.of(context).black50 : color,
        fontSize: size,
        fontWeight: weight == null ? FontWeight.normal : weight,
        decoration: textDecoration ?? null,
      ),
    );
  }
}
