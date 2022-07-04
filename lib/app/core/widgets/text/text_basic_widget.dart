import 'package:flutter/material.dart';

import '../../values/app_theme.dart';

class TextBasicWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  const TextBasicWidget({
    Key? key,
    this.text = '',
    this.color,
    this.size,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color == null ? AppTheme.of(context).black50 : color,
        fontSize: size == null ? 14 : size,
        fontWeight: weight == null ? FontWeight.normal : weight,
      ),
    );
  }
}
