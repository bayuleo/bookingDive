import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/model/form_edit_argument.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/profile/edit_profile/edit_profile_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfileScreen extends BaseView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Edit Profile',
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
              onTap: () {
                Get.toNamed(
                  Routes.FORM_EDIT_PROFILE,
                  arguments: FormEditArgument(
                      title: 'Change Name',
                      hintTop: 'First Name',
                      hintBottom: 'Last Name'),
                );
              },
            ),
            ItemProfileDetail(
                label: 'Email',
                value: 'Joh***@gmail.com',
                onTap: () {
                  Get.toNamed(
                    Routes.FORM_EDIT_PROFILE,
                    arguments: FormEditArgument(
                      title: 'Email',
                      hintTop: 'Email',
                    ),
                  );
                }),
            ItemProfileDetail(
                label: 'Date of Birth',
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now(),
                  );
                }),
            ItemProfileDetail(
              label: 'Gender',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 150,
                        child: CupertinoPicker(
                            onSelectedItemChanged: null,
                            itemExtent: 32,
                            children: [
                              Text('Choose One'),
                              Text('Male'),
                              Text('Female'),
                            ]),
                      );
                    });
              },
            ),
            ItemProfileDetail(
                label: 'Phone Number',
                onTap: () {
                  Get.toNamed(
                    Routes.FORM_EDIT_PROFILE,
                    arguments: FormEditArgument(
                      title: 'Phone Number',
                      hintTop: 'Phone Number',
                    ),
                  );
                }),
            ItemProfileDetail(
                label: 'Country',
                onTap: () {
                  Get.toNamed(
                    Routes.FORM_EDIT_PROFILE,
                    arguments: FormEditArgument(
                      title: 'Country',
                      hintTop: 'Country',
                    ),
                  );
                }),
            ItemProfileDetail(
                label: 'Home Address',
                onTap: () {
                  Get.toNamed(
                    Routes.FORM_EDIT_PROFILE,
                    arguments: FormEditArgument(
                      title: 'Home Address',
                      hintTop: 'Home Address',
                    ),
                  );
                }),
            ItemProfileDetail(
              label: 'Years of Diving',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 150,
                        child: CupertinoPicker(
                            onSelectedItemChanged: null,
                            itemExtent: 32,
                            children: [
                              Text('Pick Years'),
                              Text('0'),
                              Text('2'),
                              Text('3'),
                              Text('4'),
                              Text('5'),
                              Text('6'),
                              Text('7'),
                              Text('8'),
                              Text('9'),
                              Text('10'),
                              Text('11'),
                              Text('12'),
                              Text('13'),
                              Text('14'),
                              Text('15'),
                              Text('16'),
                              Text('17'),
                              Text('18'),
                              Text('19'),
                              Text('20'),
                              Text('21'),
                              Text('22'),
                              Text('23'),
                              Text('24'),
                              Text('25'),
                              Text('26'),
                              Text('27'),
                              Text('28'),
                              Text('29'),
                              Text('30'),
                              Text('31'),
                              Text('32'),
                              Text('33'),
                              Text('34'),
                              Text('35'),
                              Text('36'),
                              Text('37'),
                              Text('38'),
                              Text('39'),
                              Text('40'),
                            ]),
                      );
                    });
              },
            ),
            ItemProfileDetail(
              label: 'Emergency Contact',
              showDivider: false,
              onTap: () {
                Get.toNamed(
                  Routes.FORM_EDIT_PROFILE,
                  arguments: FormEditArgument(
                    title: 'Emergency Contact',
                    hintTop: 'Emergency Contact',
                  ),
                );
              },
            ),
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
                onTap: () {
                  Get.toNamed(Routes.LIST_PAYMENT_METHOD);
                }),
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
                onTap: () {
                  Get.toNamed(Routes.CHANGE_PASSWORD);
                }),
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
    Function()? onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
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
