import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'core/values/app_theme_data.dart';

abstract class AppController extends GetxController {
  AppThemeData themeData = AppThemeData.light;

  void fetchTheme();

  // Future<void> changeTheme([AppThemeMode? themeMode]);
}

class AppControllerImpl extends AppController with WidgetsBindingObserver {
  @override
  void fetchTheme() {
    // TODO: implement fetchTheme
  }

  // @override
  // Future<void> changeTheme([themeMode]) {
  //   // TODO: implement changeTheme
  //   throw UnimplementedError();
  // }
}
