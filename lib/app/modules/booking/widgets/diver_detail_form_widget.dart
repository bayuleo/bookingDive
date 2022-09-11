import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/booking/booking_detail_controller.dart';
import 'package:flutter/material.dart';

class DiverDetailFormWidget extends StatelessWidget with BaseWidgetMixin {
  final BookingDetailController controller;
  final int index;
  const DiverDetailFormWidget({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 4,
          color: theme.disable,
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBasicWidget(
                text: 'Diver Detail - ${index + 1}',
                weight: FontWeight.w700,
                size: 16,
                color: Colors.black,
              ),
              index == 0 && controller.userCredentials?.accessToken != null
                  ? Row(
                      children: [
                        Checkbox(
                          value: controller.isUseLoginInformation,
                          onChanged: (value) =>
                              controller.onChangeIsUseLoginInformation(),
                        ),
                        TextBasicWidget(
                          text: 'Use login information',
                          weight: FontWeight.w400,
                          size: 14,
                          color: theme.black50,
                        ),
                      ],
                    )
                  : const Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'First name',
                  controller: controller.firstNameControllers[index],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Last name',
                  controller: controller.lastNameControllers[index],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Phone Number',
                  controller: controller.phoneNumberControllers[index],
                ),
              ),
              const TextFormFieldOutlineWidget(
                hint: 'Certificate Number',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
