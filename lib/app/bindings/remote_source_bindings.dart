import 'package:bookingdive/app/data/local/user_credentials_data_source.dart';
import 'package:bookingdive/app/data/remote/auth_data_source.dart';
import 'package:bookingdive/app/data/remote/cities_data_source.dart';
import 'package:bookingdive/app/data/remote/location_data_source.dart';
import 'package:bookingdive/app/data/remote/payment_data_source.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthDataSource>(
      () => AuthDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<UserCredentialsDataSource>(
      () => UserCredentialsDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<LocationDataSource>(
      () => LocationDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<PaymentDataSource>(
      () => PaymentDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<CitiesDataSource>(
      () => CitiesDataSourceImpl(),
      fenix: true,
    );
  }
}
