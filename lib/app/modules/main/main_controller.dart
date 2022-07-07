import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../gen/assets.gen.dart';
import '../../core/base/base_controller.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/user_credentials_repository.dart';
import 'models/bottom_nav_item.dart';

class MainController extends BaseController {
  final AuthRepository _authRepository = Get.find();
  final UserCredentialsRepository _userCredentialsRepository = Get.find();

  String? email;
  String? token;
  String? refreshToken;

  var pageIndex = 0;

  @override
  void onReady() async {
    var credential = await _userCredentialsRepository.getCredentials();
    email = credential.email;
    token = credential.accessToken;
    refreshToken = credential.refreshToken;
    update();
    super.onReady();
  }

  Future<void> handleButtonLogout() async {
    var res = await _authRepository.signOut();
    if (res) Get.offAllNamed(Routes.LOGIN);
  }

  onPressedNavBarItem(int index) {
    pageIndex = index;
    update();
  }

  List<BottomNavItem> getBottomNavItems() {
    // final roleId = permissionsResponse?.userRoleId;
    return [
      BottomNavItem(
        icon: Assets.icons.homeInactiveIcon,
        activeIcon: Assets.icons.homeIcon,
        label: "Home",
      ),
      BottomNavItem(
        icon: Assets.icons.homeInactiveIcon,
        activeIcon: Assets.icons.homeIcon,
        label: "Booking",
      ),
      BottomNavItem(
        icon: Assets.icons.homeInactiveIcon,
        activeIcon: Assets.icons.homeIcon,
        label: "Wishlist",
      ),
      BottomNavItem(
        icon: Assets.icons.homeInactiveIcon,
        activeIcon: Assets.icons.homeIcon,
        label: "Inbox",
      ),
      BottomNavItem(
        icon: Assets.icons.homeInactiveIcon,
        activeIcon: Assets.icons.homeIcon,
        label: "Profile",
      ),
    ];
  }
}
