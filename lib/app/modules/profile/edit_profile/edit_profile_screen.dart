import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/utils/date.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/profile/edit_profile/edit_profile_controller.dart';
import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_controller.dart';
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
              value: controller.profileData?.firstName,
              onTap: () {
                controller.onTapEdit(
                  title: 'Change Name',
                  hintTop: 'First Name',
                  hintBottom: 'Last Name',
                  inputProfileType: InputProfileType.name,
                );
              },
            ),
            ItemProfileDetail(
                label: 'Email',
                value: controller.profileData?.email,
                onTap: () {
                  controller.onTapEdit(
                    title: 'Email',
                    hintTop: 'Email',
                    inputProfileType: InputProfileType.email,
                  );
                }),
            ItemProfileDetail(
                label: 'Date of Birth',
                value: controller.profileData?.dateOfBirth,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateHelper.formatDateStringToDateTime(
                        controller.profileData?.dateOfBirth),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then(
                    (value) => controller.onSubmitValue(
                      InputProfileType.dateOfBirth,
                      DateHelper.formatDate(value!),
                    ),
                  );
                }),
            ItemProfileDetail(
              label: 'Gender',
              value: controller.profileData?.gender,
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
                value: controller.profileData?.phoneNumber,
                onTap: () {
                  controller.onTapEdit(
                    title: 'Phone Number',
                    hintTop: 'Phone Number',
                    inputProfileType: InputProfileType.phone,
                  );
                }),
            ItemProfileDetail(
                label: 'Country',
                value: controller.profileData?.countryName,
                onTap: () {
                  controller.onTapEdit(
                    title: 'Country',
                    hintTop: 'Country',
                    inputProfileType: InputProfileType.country,
                  );
                }),
            ItemProfileDetail(
                label: 'Home Address',
                value: controller.profileData?.address,
                onTap: () {
                  controller.onTapEdit(
                    title: 'Home Address',
                    hintTop: 'Home Address',
                    inputProfileType: InputProfileType.address,
                  );
                }),
            ItemProfileDetail(
              label: 'Years of Diving',
              value: controller.profileData?.yearDiving.toString(),
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
              value: controller.profileData?.emergencyContact,
              showDivider: false,
              onTap: () {
                controller.onTapEdit(
                  title: 'Emergency Contact',
                  hintTop: 'Emergency Contact',
                  inputProfileType: InputProfileType.emergencyContact,
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
                        text: value == null || value == '' ? 'Set now' : value,
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
