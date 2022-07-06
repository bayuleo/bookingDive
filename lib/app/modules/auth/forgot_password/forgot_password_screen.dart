import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/utils/validator.dart';
import 'package:bookingdive/app/modules/auth/widgets/auth_body_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/button/button_basic_widget.dart';
import '../../../core/widgets/text/text_basic_widget.dart';
import '../../../core/widgets/text/text_field_outline_widget.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends BaseView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
            child: Center(
              child: TextBasicWidget(
                text: 'Forgot Password',
                size: 32,
                weight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormFieldOutlineWidget(
              hint: "Email",
              validator: TextFieldValidatorHelper.validateEmail,
              controller: controller.emailController,
              onChangedText: controller.onChangedText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: ButtonBasicWidget(
              text: 'Reset Password',
              isFullWidht: true,
              enable: controller.isEnableButton,
              onTap: controller.handleSubmitResetPasswordButton,
            ),
          ),
        ],
      ),
    );
  }
}
