import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/main/widgets/seach_section_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_view.dart';
import 'main_controller.dart';

class MainScreen extends BaseView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    final bottomNavItems = controller.getBottomNavItems();
    return Scaffold(
      backgroundColor: theme.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Assets.images.bannerHome.image(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 32, top: 40, bottom: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: theme.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextBasicWidget(
                            text: 'USD | ENG',
                            color: theme.white,
                            weight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextBasicWidget(
                    text: 'Explore Underwater',
                    size: 28,
                    weight: FontWeight.w700,
                    color: theme.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 20),
                    child: TextBasicWidget(
                      text:
                          'Browse and book your next dive from all\naround the world.',
                      textAlign: TextAlign.center,
                      weight: FontWeight.w400,
                      color: theme.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: SearchSectionWidget(theme: theme),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        TextBasicWidget(
                          text: 'Nearest',
                          color: theme.main50,
                          size: 18,
                          weight: FontWeight.w700,
                        ),
                        TextBasicWidget(
                          text: ' Diving Center',
                          color: theme.black50,
                          size: 18,
                          weight: FontWeight.w700,
                        )
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 3,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Column(
                  //           children: [
                  //             Assets.images.loginBanner.image(),
                  //             TextBasicWidget(
                  //               text: 'Scuba Diving Courses and Fun Dives',
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Assets.icons.personIcon.svg(),
                  //                 TextBasicWidget(
                  //                   text: 'Sampoerna, Malaysia',
                  //                 )
                  //               ],
                  //             ),
                  //             Row(
                  //               children: [
                  //                 TextBasicWidget(
                  //                   text: 'Starts from ',
                  //                 ),
                  //                 TextBasicWidget(
                  //                   text: 'IDR 500,000',
                  //                 ),
                  //               ],
                  //             )
                  //           ],
                  //         );
                  //       }),
                  // ),
                  Text("Main Body"),
                  Text("Email : ${controller.email}"),
                  Text("Token : ${controller.token}"),
                  Text("Refresh Token : ${controller.refreshToken}"),
                  ButtonBasicWidget(
                    text: 'Logout',
                    onTap: controller.handleButtonLogout,
                  )
                ],
              ),
            ),
          ],
        ),
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
