import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/utils/app_focus.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_controller.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
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
        child: controller.initData!.inputProfileType == InputProfileType.country
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      padding: EdgeInsets.only(left: 8, right: 0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: theme.black10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CountryPickerDropdown(
                        hint: TextBasicWidget(
                          text: 'Country',
                        ),
                        itemBuilder: (Country country) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: CountryPickerUtils.getDefaultFlagImage(
                                      country),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: TextBasicWidget(
                                      text: country.name,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        onValuePicked: (Country country) {
                          controller.country = country;
                          print(
                              "${country.name} ${country.isoCode} ${country.phoneCode}");
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ButtonBasicWidget(
                      isFullWidht: true,
                      text: 'Save Changes',
                      onTap: () {
                        AppFocus.unfocus(context);
                        controller.onClickSubmit();
                      },
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextFormFieldOutlineWidget(
                      hint: controller.initData?.hintTop,
                      controller: controller.topTextEditingController,
                      keyboardType: controller.initData?.inputProfileType ==
                                  InputProfileType.phone ||
                              controller.initData?.inputProfileType ==
                                  InputProfileType.emergencyContact
                          ? TextInputType.phone
                          : controller.initData?.inputProfileType ==
                                  InputProfileType.email
                              ? TextInputType.emailAddress
                              : TextInputType.text,
                    ),
                  ),
                  controller.initData?.hintBottom != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormFieldOutlineWidget(
                            hint: controller.initData?.hintBottom,
                            controller: controller.bottomTextEditingController,
                          ),
                        )
                      : Padding(padding: EdgeInsets.zero),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ButtonBasicWidget(
                      isFullWidht: true,
                      text: 'Save Changes',
                      onTap: () {
                        AppFocus.unfocus(context);
                        controller.onClickSubmit();
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

Widget _buildDropdownItem(Country country) => Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: CountryPickerUtils.getDefaultFlagImage(country),
          ),
          // SizedBox(
          //   width: 8.0,
          // ),
          // Text("${country.name}",),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextBasicWidget(
              text: country.name,
            ),
          )
        ],
      ),
    );
