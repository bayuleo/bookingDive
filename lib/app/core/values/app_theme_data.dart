import 'package:flutter/material.dart';

class AppThemeData {
  final Color yellow10;
  final Color yellow30;
  final Color yellow50;
  final Color yellow70;
  final Color yellow90;
  final Color black10;
  final Color black30;
  final Color black50;
  final Color black70;
  final Color black90;
  final Color main10;
  final Color main30;
  final Color main50;
  final Color main70;
  final Color main90;
  final Color error10;
  final Color error30;
  final Color error50;
  final Color error70;
  final Color error90;
  final Color success10;
  final Color success30;
  final Color success50;
  final Color success70;
  final Color success90;
  final Color white;
  final Color disable;
  final Color backgrounGrey;

  const AppThemeData(
      {required this.yellow10,
      required this.yellow30,
      required this.yellow50,
      required this.yellow70,
      required this.yellow90,
      required this.black10,
      required this.black30,
      required this.black50,
      required this.black70,
      required this.black90,
      required this.main10,
      required this.main30,
      required this.main50,
      required this.main70,
      required this.main90,
      required this.error10,
      required this.error30,
      required this.error50,
      required this.error70,
      required this.error90,
      required this.success10,
      required this.success30,
      required this.success50,
      required this.success70,
      required this.success90,
      required this.white,
      required this.backgrounGrey,
      required this.disable});

  static AppThemeData get light {
    return const AppThemeData(
      yellow10: Color(0xFFFEFAD0),
      yellow30: Color(0xFFFCF389),
      yellow50: Color(0xFFFAEC3A),
      yellow70: Color(0xFFF9E813),
      yellow90: Color(0xFFF7C144),
      black10: Color(0xFFD9D9D9),
      black30: Color(0xFF818181),
      black50: Color(0xFF424242),
      black70: Color(0xFF2C2C2C),
      black90: Color(0xFF0D0D0D),
      main10: Color(0xFFDBEFFB),
      main30: Color(0xFFA5D6F4),
      main50: Color(0xFF4BAEEA),
      main70: Color(0xFF228AC9),
      main90: Color(0xFF32749C),
      error10: Color(0xFFEED2D2),
      error30: Color(0xFFD58F8F),
      error50: Color(0xFFAC2020),
      error70: Color(0xFF8F1B1B),
      error90: Color(0xFF731515),
      success10: Color(0xFFDBF5DC),
      success30: Color(0xFFA4E7A6),
      success50: Color(0xFF49CF4E),
      success70: Color(0xFF318A34),
      success90: Color(0xFF18451A),
      white: Color(0xFFFFFFFF),
      disable: Color(0xFFF3F3F3),
      backgrounGrey: Color(0xFFF5F5F5),
    );
  }

  // static AppThemeData get dark {
  //   return const AppThemeData(
  //     branding: Color(0xFF1e8bc3),
  //     textBlack: Color(0x00000000),
  //     background: Color(0xFFFFFFFF),
  //     lightGrey: Color(0xFFa6a6a6),
  //     grey: Color(0xFFABB3BB),
  //   );
  // }
}
