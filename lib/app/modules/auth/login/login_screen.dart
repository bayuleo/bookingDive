import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_image_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/base/base_view.dart';
import '../../../core/utils/validator.dart';
import '../../../core/widgets/container/simple_body_widget.dart';
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
    return SimpleBodyWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.loginBanner.image(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                                side:
                                    BorderSide(width: 1, color: theme.black10),
                                onChanged: controller.handleClickRememberMe()),
                            TextBasicWidget(text: 'Remember me'),
                          ],
                        ),
                        TextBasicWidget(
                          text: 'Forget password?',
                          color: theme.main50,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  ButtonBasicWidget(
                    text: 'Sign In',
                    isFullWidht: true,
                    onTap: () {},
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
                        TextBasicWidget(
                          text: 'Register',
                          color: theme.main50,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: GestureDetector(
        //   behavior: HitTestBehavior.translucent,
        //   onTap: FocusScope.of(context).unfocus,
        //   child: Column(
        //     children: [
        //       Assets.images.loginBanner.image(),
        //       Container(
        //         padding: const EdgeInsets.symmetric(horizontal: 30),
        //         margin: const EdgeInsets.only(top: 0),
        //         height: SizeConfig().screenHeight - 130,
        //         width: SizeConfig().screenWidth,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Center(
        //                 child: Text(
        //               'Sign in',
        //               style:
        //                   TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        //             )),
        //             TextFieldWithLabelWidget(
        //               key: const ValueKey('login_username_text_field'),
        //               hint: "Email",
        //               controller: controller.usernameController,
        //               keyboardType: TextInputType.text,
        //               validator: validateUsername,
        //             ),
        //             TextFieldWithLabelWidget(
        //               key: const ValueKey('login_password_text_field'),
        //               hint: "Password",
        //               controller: controller.passwordController,
        //               keyboardType: TextInputType.text,
        //               obsecure: !controller.isShownPassword,
        //               rightIcon: controller.isShownPassword
        //                   ? Assets.icons.passwordShow.svg(
        //                       color: theme.black10,
        //                       key: const ValueKey(
        //                           'password_visibility_off_icon'),
        //                     )
        //                   : Assets.icons.passwordHide.svg(
        //                       color: theme.black10,
        //                       key:
        //                           const ValueKey('password_visibility_on_icon'),
        //                     ),
        //               rightIconKey: const ValueKey(
        //                 'toggle_obscure_password_button',
        //               ),
        //               onTapRightIcon: controller.onTapShowPassword,
        //               onChangedText: controller.onChangedText,
        //               validator: validatePassword,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Checkbox(
        //                         value: controller.isRememberMe,
        //                         onChanged: controller.handleClickRememberMe()),
        //                     Text(
        //                       "Remember me",
        //                       style: TextStyle(color: theme.black50),
        //                     ),
        //                   ],
        //                 ),
        //                 TextButton(
        //                   key: const ValueKey('forgot_password_button'),
        //                   style: TextButton.styleFrom(
        //                     visualDensity: VisualDensity.compact,
        //                   ),
        //                   onPressed: () {},
        //                   child: Text(
        //                     "Forgot password",
        //                     style: TextStyle(color: theme.main50),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Expanded(
        //                   child: Divider(),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 12),
        //                   child: Text(
        //                     ' or continue with ',
        //                     style: TextStyle(color: theme.black30),
        //                   ),
        //                 ),
        //                 Expanded(
        //                   child: Divider(),
        //                 ),
        //               ],
        //             ),
        //             ButtonWidget(
        //               key: const ValueKey('login_button'),
        //               text: "Sign In",
        //               // enabled: controller.isEnabledLoginButton,
        //               onTap: controller.login,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   "Don’t have account?",
        //                   style: TextStyle(color: theme.black30),
        //                 ),
        //                 TextButton(
        //                   key: const ValueKey('signup_button'),
        //                   style: TextButton.styleFrom(
        //                     visualDensity: VisualDensity.compact,
        //                   ),
        //                   onPressed: () {
        //                     // TODO: Uncomment sign up
        //                     // isLoading ? null : Get.toNamed(Routes.SIGN_UP);
        //                   },
        //                   child: Text(
        //                     "Register",
        //                     style: TextStyle(color: theme.main50),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
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
