import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile/profile_controller.dart';

class ProfileScreen extends BaseView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 70, left: 24, right: 30, bottom: 24),
          decoration: BoxDecoration(color: theme.main70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(controller.profileData?.avatar ?? ''),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBasicWidget(
                          text:
                              '${controller.profileData?.firstName ?? ''} ${controller.profileData?.lastName ?? ''}',
                          color: Colors.white,
                          weight: FontWeight.w700,
                          size: 16,
                        ),
                        TextBasicWidget(
                          text: controller.profileData?.email ?? '',
                          color: Colors.white,
                          weight: FontWeight.w400,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: controller.userCredentials?.accessToken != null,
                child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      await Get.toNamed(Routes.EDIT_PROFILE);
                      controller.getDataUserFromLocal();
                    },
                    child: Assets.icons.penIcon.svg()),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListMenuAccount(
                  controller: controller,
                ),
                ListMenuGeneral(
                  controller: controller,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 64),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ListMenuAccount extends StatelessWidget with BaseWidgetMixin {
  final ProfileController controller;
  const ListMenuAccount({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 24),
            child: TextBasicWidget(
              text: 'Account',
              weight: FontWeight.w600,
            ),
          ),
          ItemMenuProfileWidget(
            icon: Assets.icons.bagIcon.svg(),
            title: "My Booking",
            onTap: () {
              controller.onTapMyBooking();
            },
          ),
          // ItemMenuProfileWidget(
          //   icon: Assets.icons.heartIcon.svg(color: theme.black10),
          //   title: "My Wishlist",
          //   onTap: () {},
          // ),
          // ItemMenuProfileWidget(
          //   icon: Assets.icons.cardIcon.svg(),
          //   title: "Payment Methods",
          //   onTap: () {},
          // ),
          ItemMenuProfileWidget(
            icon: Assets.icons.dollarIcon.svg(),
            title: "Become a Host",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ListMenuGeneral extends StatelessWidget with BaseWidgetMixin {
  final ProfileController controller;
  const ListMenuGeneral({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 24),
            child: TextBasicWidget(
              text: 'General',
              weight: FontWeight.w600,
            ),
          ),
          ItemMenuProfileWidget(
            icon: Assets.icons.phoneIcon.svg(),
            title: "Contact Us",
            onTap: () {},
          ),
          ItemMenuProfileWidget(
            icon: Assets.icons.lockIcon.svg(),
            title: "Privacy",
            onTap: () {},
          ),
          ItemMenuProfileWidget(
            icon: Assets.icons.fileIcon.svg(),
            title: "Cancellation Policy",
            onTap: () {},
          ),
          ItemMenuProfileWidget(
            icon: Assets.icons.iWarningIcon.svg(),
            title: "Terms of Service",
            onTap: () {},
          ),
          Visibility(
            visible: controller.userCredentials?.accessToken != null,
            child: ItemMenuProfileWidget(
              icon: Assets.icons.logoutIcon.svg(),
              title: "Log Out",
              showRightIcon: false,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: TextBasicWidget(text: 'Do you want to log out?'),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: TextBasicWidget(
                                text: 'cancel',
                                size: 16,
                                weight: FontWeight.w400,
                                color: theme.main50,
                                textDecoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: InkWell(
                              onTap: controller.handleButtonLogout,
                              child: TextBasicWidget(
                                text: 'log out',
                                size: 16,
                                weight: FontWeight.w400,
                                color: theme.main50,
                                textDecoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMenuProfileWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function()? onTap;
  final bool showRightIcon;

  const ItemMenuProfileWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
    this.showRightIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 30, bottom: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextBasicWidget(
                        text: title,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                showRightIcon
                    ? Assets.icons.rightStroke.svg()
                    : Padding(padding: EdgeInsets.zero),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 64),
          child: Divider(),
        ),
      ],
    );
  }
}
