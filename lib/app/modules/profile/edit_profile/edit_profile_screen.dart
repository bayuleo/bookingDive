import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/profile/edit_profile/edit_profile_controller.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfileScreen extends BaseView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: theme.main70,
        leading: Transform.scale(
          scale: 0.3,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.icons.leftStrokeIcon.svg(height: 16, width: 4),
            ),
          ),
        ),
        titleSpacing: 0,
        title: TextBasicWidget(
          text: 'Edit Profile',
          size: 16,
          color: Colors.white,
          weight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: theme.main70),
              width: double.infinity,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 24),
                    child: TextBasicWidget(
                      text: 'Tap to change',
                      size: 12,
                      weight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            ItemProfileDetail(
              label: 'First Name',
              value: 'John',
            ),
            ItemProfileDetail(
              label: 'Last Name',
              value: 'Doe',
            ),
            ItemProfileDetail(
              label: 'Email',
              value: 'Joh***@gmail.com',
            ),
            ItemProfileDetail(
              label: 'Date of Birth',
            ),
            ItemProfileDetail(
              label: 'Gender',
            ),
            ItemProfileDetail(
              label: 'Phone Number',
            ),
            ItemProfileDetail(
              label: 'Country',
            ),
            ItemProfileDetail(
              label: 'Home Address',
            ),
            ItemProfileDetail(
              label: 'Years of Diving',
            ),
            ItemProfileDetail(label: 'Emergency Contact', showDivider: false),
            Divider(
              color: theme.disable,
              thickness: 16,
            ),
            ItemProfileDetail(
              label: 'Manage Payment Method',
              value: '',
              showDivider: false,
              padding:
                  EdgeInsets.only(top: 14, bottom: 14, left: 24, right: 32),
            ),
            Divider(
              color: theme.disable,
              thickness: 16,
            ),
            ItemProfileDetail(
              label: 'Change Password',
              value: '',
              showDivider: false,
              padding:
                  EdgeInsets.only(top: 14, bottom: 20, left: 24, right: 32),
            ),
            Divider(
              color: theme.disable,
              thickness: 24,
            ),
          ],
        ),
      ),
    );
  }

  Column ItemProfileDetail({
    required String label,
    String? value,
    bool showDivider = true,
    EdgeInsets? padding,
  }) {
    return Column(
      children: [
        Padding(
          padding: padding ??
              const EdgeInsets.only(left: 24, right: 32, top: 10, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBasicWidget(
                text: label,
                size: 14,
                color: theme.black50,
                weight: FontWeight.w400,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: TextBasicWidget(
                      text: value ?? 'Set now',
                      size: 14,
                      color: value == null ? theme.black30 : theme.black50,
                      weight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Assets.icons.rightStroke.svg(color: theme.black30),
                  ),
                ],
              )
            ],
          ),
        ),
        showDivider
            ? Divider(
                color: theme.black10,
                thickness: 1,
              )
            : Padding(padding: EdgeInsets.zero),
      ],
    );
  }
}
