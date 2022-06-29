import 'package:flutter/material.dart';

class AppThemeData {
  final Color branding;
  final Color textBlack;
  final Color background;
  final Color lightGrey;

  const AppThemeData(
      {required this.branding,
      required this.textBlack,
      required this.lightGrey,
      required this.background});

  static AppThemeData get light {
    return const AppThemeData(
      branding: Color(0xFF1e8bc3),
      textBlack: Color(0x00000000),
      background: Color(0xFFFFFFFF),
      lightGrey: Color(0xFFa6a6a6),
    );
  }

  static AppThemeData get dark {
    return const AppThemeData(
      branding: Color(0xFF1e8bc3),
      textBlack: Color(0x00000000),
      background: Color(0xFFFFFFFF),
      lightGrey: Color(0xFFa6a6a6),
    );
  }
}
