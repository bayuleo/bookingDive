import 'package:bookingdive/app/modules/main/profile/profile_screen.dart';
import 'package:bookingdive/app/modules/main/whislist/whislist_screen.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../core/base/base_controller.dart';
import 'home/home_screen.dart';
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
      const WhistlistScreen(),
      const SizedBox(),
      const ProfileScreen(),
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
        icon: Assets.icons.bagIcon,
        activeIcon: Assets.icons.bagIcon,
        label: "Booking",
      ),
      BottomNavItem(
        icon: Assets.icons.heartGreyIcon,
        activeIcon: Assets.icons.heartBlueIcon,
        label: "Wishlist",
      ),
      BottomNavItem(
        icon: Assets.icons.chatIcon,
        activeIcon: Assets.icons.chatIcon,
        label: "Inbox",
      ),
      BottomNavItem(
        icon: Assets.icons.personGreyIcon,
        activeIcon: Assets.icons.personBlueIcon,
        label: "Profile",
      ),
    ];
  }
}
