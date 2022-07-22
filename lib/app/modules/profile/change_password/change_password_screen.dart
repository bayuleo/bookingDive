import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/profile/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/app_bars/app_bar_widget.dart';
import '../../../core/widgets/text/text_basic_widget.dart';

class ChangePasswordScreen extends BaseView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Change Password',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            TextBasicWidget(
              text:
                  'For the security of your account, please do not share your password with others.',
              color: theme.black30,
              weight: FontWeight.w400,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: TextFormFieldOutlineWidget(
                hint: 'Current Password',
                rightIcon: Assets.icons.passwordHide.svg(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextFormFieldOutlineWidget(
                hint: 'New Password',
                rightIcon: Assets.icons.passwordHide.svg(),
              ),
            ),
            TextFormFieldOutlineWidget(
              hint: 'Confirm Password',
              rightIcon: Assets.icons.passwordHide.svg(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ButtonBasicWidget(
                text: 'Save Changes',
                isFullWidht: true,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
