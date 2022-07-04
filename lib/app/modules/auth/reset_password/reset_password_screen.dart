import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/modules/auth/reset_password/reset_password_controller.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/text/text_basic_widget.dart';
import '../../../core/widgets/text/text_field_outline_widget.dart';
import '../widgets/auth_body_widget.dart';

class ResetPasswordScreen extends BaseView<ResetPasswordController> {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return AuthBodyWidget(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(
            child: TextBasicWidget(
              text: 'Reset Password',
              size: 32,
              weight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormFieldOutlineWidget(
            hint: "New password",
            rightIcon: Assets.icons.passwordShow.svg(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormFieldOutlineWidget(
            hint: "Confirm new password",
            rightIcon: Assets.icons.passwordShow.svg(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: ButtonBasicWidget(
            onTap: controller.handleButtonReset,
            isFullWidht: true,
            text: 'Reset Password',
          ),
        )
      ]),
    );
  }
}
