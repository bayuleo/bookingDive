import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_image_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/auth/widgets/auth_body_widget.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import 'login_controller.dart';

class LoginScreen extends BaseView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

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
                text: 'Sign in',
                size: 32,
                weight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormFieldOutlineWidget(
              hint: "Email",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormFieldOutlineWidget(
              hint: "Password",
              rightIcon: Assets.icons.passwordShow.svg(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        checkColor: theme.black10,
                        focusColor: theme.black10,
                        value: controller.isRememberMe,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: BorderSide(width: 1, color: theme.black10),
                        onChanged: controller.handleClickRememberMe()),
                    TextBasicWidget(text: 'Remember me'),
                  ],
                ),
                GestureDetector(
                  onTap: controller.handleCLickForgotPassword,
                  child: TextBasicWidget(
                    text: 'Forget password?',
                    color: theme.main50,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ButtonBasicWidget(
            text: 'Sign In',
            isFullWidht: true,
            onTap: controller.handleClickLogin,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: theme.black30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextBasicWidget(
                    text: 'or continue with',
                    color: theme.black30,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: theme.black30,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ButtonImageWidget(
                    image: Assets.icons.googleIcon.svg(),
                    onTap: () {},
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ButtonImageWidget(
                    image: Assets.icons.facebookIcon.svg(),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextBasicWidget(
                  text: 'Don’t have account? ',
                  color: theme.black30,
                ),
                GestureDetector(
                  onTap: controller.handleClickRegister,
                  child: TextBasicWidget(
                    text: 'Register',
                    color: theme.main50,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  validateUsername(value) {
    final validatorResult = ValidatorHelper.validateCommon(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Username required";
    }
    return null;
  }

  validatePassword(value) {
    final validatorResult = ValidatorHelper.validatePassword(value);
    if (validatorResult == ValidatorResult.empty) {
      return "Password required";
    } else if (validatorResult == ValidatorResult.invalid) {
      return "Password invalid";
    }
    return null;
  }
}
