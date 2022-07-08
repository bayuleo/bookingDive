import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../core/base/base_controller.dart';
import '../home/home_screen.dart';
import 'models/bottom_nav_item.dart';

class MainController extends BaseController {
  var pageIndex = 0;

  @override
  void onReady() async {
    super.onReady();
  }

  List<Widget> getPages() {
    return [
      const HomeScreen(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
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
