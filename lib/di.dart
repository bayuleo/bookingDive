import 'package:bookingdive/app/bindings/local_source_bindings.dart';
import 'package:bookingdive/app/bindings/remote_source_bindings.dart';
import 'package:bookingdive/app/bindings/repository_bindings.dart';
import 'package:bookingdive/app/network/endpoints.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_controller.dart';
import 'app/network/dio_config.dart';
import 'flavors/flavors.dart';

class DependencyInjection {
  static Future<void> init(Flavor flavor) async {
    await Get.putAsync(() => StorageService().init());
    await GetStorage.init();
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
    LocalSourceBindings().dependencies();
    Get.lazyPut<DioConfigure>(() => DioConfigure(), fenix: true);
    Get.lazyPut<Endpoints>(() => Endpoints(), fenix: true);
    Get.lazyPut<AppController>(() => AppControllerImpl(), fenix: true);
    Get.lazyPut<Logger>(
      () => Logger(
        printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 8,
          lineLength: 100,
          colors: false,
          printEmojis: true,
          printTime: true,
        ),
      ),
      fenix: true,
    );
  }
}

class StorageService extends GetxService {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
