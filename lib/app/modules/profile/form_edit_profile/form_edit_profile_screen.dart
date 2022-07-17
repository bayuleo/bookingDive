import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormEditProfileScreen extends BaseView<FormEditProfileController> {
  final String title;
  final String hintTopTextForm;
  final String hintBottomTextForm;

  const FormEditProfileScreen({
    Key? key,
    this.title = '',
    this.hintTopTextForm = '',
    this.hintBottomTextForm = '',
  }) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: controller.initData?.title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: TextFormFieldOutlineWidget(
                hint: controller.initData?.hintTop,
              ),
            ),
            controller.initData?.hintBottom != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormFieldOutlineWidget(
                      hint: controller.initData?.hintBottom,
                    ),
                  )
                : Padding(padding: EdgeInsets.zero),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ButtonBasicWidget(
                isFullWidht: true,
                text: 'Save Changes',
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
