import 'package:bookingdive/app/data/local/user_credentials_data_source.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCredentialsDataSource>(
      () => UserCredentialsDataSourceImpl(),
      fenix: true,
    );
  }
}
