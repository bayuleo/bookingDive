import 'package:bookingdive/app/data/repository/auth_repository.dart';
import 'package:bookingdive/app/data/repository/location_repository.dart';
import 'package:bookingdive/app/data/repository/user_credentials_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<UserCredentialsRepository>(
      () => UserCredentialsRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LocationRepository>(
      () => LocationRepositoryImpl(),
      fenix: true,
    );
  }
}
