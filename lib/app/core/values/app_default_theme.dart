import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppDefaultTheme {
  static ThemeData theme(AppThemeData appThemeData) => ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: appThemeData.black50,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.45,
          ),
        ),
      );
}
