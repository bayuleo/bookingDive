import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/button/button_basic_widget.dart';
import '../../../core/widgets/button/button_image_widget.dart';
import '../../../core/widgets/text/text_basic_widget.dart';
import '../widgets/auth_body_widget.dart';

class RegisterScreen extends BaseView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

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
                text: 'Register',
                size: 32,
                weight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextFormFieldOutlineWidget(
                      hint: 'First name',
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextFormFieldOutlineWidget(
                      hint: 'Last name',
                    ),
                  ),
                ),
              ],
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
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextFormFieldOutlineWidget(
              hint: "Confirm password",
              rightIcon: Assets.icons.passwordShow.svg(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: ButtonBasicWidget(
              text: 'Sign Up',
              isFullWidht: true,
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
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
                    text: 'or connect with',
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
                  text: 'Already have an account? ',
                  color: theme.black30,
                ),
                GestureDetector(
                  onTap: controller.handleButtonLogin,
                  child: TextBasicWidget(
                    text: 'Login',
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
}
