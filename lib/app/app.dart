import 'package:bookingdive/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../flavors/flavors.dart';
import 'app_controller.dart';
import 'core/values/app_default_theme.dart';
import 'core/values/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) => AppTheme(
        appTheme: controller.themeData,
        child: GetMaterialApp(
          title: FlavorConfigs.name,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppDefaultTheme.theme(controller.themeData),
          debugShowCheckedModeBanner: FlavorConfigs.isDEV,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
