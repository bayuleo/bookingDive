import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../core/base/base_view.dart';
import '../../core/utils/size_config.dart';
import '../../core/utils/validator.dart';
import '../../core/widgets/app_bar_widget.dart';
import '../../core/widgets/button/button_widget.dart';
import '../../core/widgets/container/simple_body_widget.dart';
import '../../core/widgets/text/text_field_with_label_widget.dart';
import 'login_controller.dart';

class LoginScreen extends BaseView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.white,
      appBar: AppBarWidget(
        titleText: "Login Screen",
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SimpleBodyWidget(
      child: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: FocusScope.of(context).unfocus,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(top: 30),
            height: SizeConfig().screenHeight - 130,
            width: SizeConfig().screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFieldWithLabelWidget(
                  key: const ValueKey('login_username_text_field'),
                  label: "Username",
                  hint: "Please insert your username",
                  controller: controller.usernameController,
                  keyboardType: TextInputType.text,
                  validator: validateUsername,
                ),
                TextFieldWithLabelWidget(
                  key: const ValueKey('login_password_text_field'),
                  label: "Password",
                  hint: "Please insert your password",
                  controller: controller.passwordController,
                  keyboardType: TextInputType.text,
                  obsecure: !controller.isShownPassword,
                  rightIcon: controller.isShownPassword
                      ? Assets.icons.passwordShow.svg(
                          color: theme.black10,
                          key: const ValueKey('password_visibility_off_icon'),
                        )
                      : Assets.icons.passwordHide.svg(
                          color: theme.black10,
                          key: const ValueKey('password_visibility_on_icon'),
                        ),
                  rightIconKey: const ValueKey(
                    'toggle_obscure_password_button',
                  ),
                  onTapRightIcon: controller.onTapShowPassword,
                  onChangedText: controller.onChangedText,
                  validator: validatePassword,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      key: const ValueKey('forgot_password_button'),
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Forgot password",
                        style: TextStyle(color: theme.main50),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 35)),
                ButtonWidget(
                  key: const ValueKey('login_button'),
                  text: "Login",
                  // enabled: controller.isEnabledLoginButton,
                  onTap: controller.login,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not registered yet?",
                      style: TextStyle(color: theme.main50),
                    ),
                    TextButton(
                      key: const ValueKey('signup_button'),
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        // TODO: Uncomment sign up
                        // isLoading ? null : Get.toNamed(Routes.SIGN_UP);
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: theme.main50),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
