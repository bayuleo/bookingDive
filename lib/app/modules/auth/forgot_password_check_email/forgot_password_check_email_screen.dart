import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/auth/forgot_password_check_email/forgot_password_check_email_controller.dart';
import 'package:bookingdive/app/modules/auth/widgets/auth_body_widget.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class ForgotPasswordCheckEmailScreen
    extends BaseView<ForgotPasswordCheckEmailController> {
  const ForgotPasswordCheckEmailScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return AuthBodyWidget(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextBasicWidget(
              text: 'Check your email',
              size: 32,
              weight: FontWeight.w700,
            ),
          ),
          Assets.icons.amplopIcon.svg(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextBasicWidget(
              text:
                  'Verification link to reset your password\nhas been sent to your email',
              textAlign: TextAlign.center,
            ),
          ),
          TextBasicWidget(
            text: 'Johndoe@gmail.com',
            size: 16,
            weight: FontWeight.w700,
            color: theme.main50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: ButtonBasicWidget(
              onTap: controller.handleClickButton,
              text: 'Okay',
              isFullWidht: true,
            ),
          )
        ],
      ),
    );
  }
}
