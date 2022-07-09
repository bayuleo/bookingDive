import 'package:flutter/material.dart';

import '../../core/base/base_view.dart';
import 'main_controller.dart';

class MainScreen extends BaseView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    final bottomNavItems = controller.getBottomNavItems();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: theme.white,
      body: IndexedStack(
        index: controller.pageIndex,
        children: controller.getPages(),
      ),
      bottomNavigationBar: bottomNavItems.isEmpty
          ? null
          : BottomNavigationBar(
              currentIndex: controller.pageIndex,
              selectedItemColor: theme.main70,
              unselectedItemColor: theme.black30,
              showUnselectedLabels: true,
              backgroundColor: theme.white,
              onTap: controller.onPressedNavBarItem,
              type: BottomNavigationBarType.fixed,
              items: bottomNavItems.map((e) {
                return BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: e.icon.svg(),
                  ),
                  label: e.label,
                  activeIcon: e.activeIcon.svg(),
                );
              }).toList(),
            ),
    );
  }
}
