import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/validator.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/booking/booking_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectorBookingPaymentWidget extends StatelessWidget
    with BaseWidgetMixin {
  const SelectorBookingPaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              color: theme.white,
              borderRadius: const BorderRadius.only(
                topRight: const Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 9,
                  color: Colors.black.withOpacity(0.2),
                ),
              ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 32, bottom: 32, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: TextBasicWidget(
                    text: 'Payment',
                    size: 18,
                    weight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormFieldOutlineWidget(
                    hint: 'Amount billed',
                    controller: controller.amountPaymentController,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    validator: TextFieldValidatorHelper.validateRequired,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChangedText: controller.onChangedText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormFieldOutlineWidget(
                    hint: 'Insert Credit Card Number',
                    keyboardType: TextInputType.number,
                    controller: controller.ccNumberPaymentController,
                    validator: TextFieldValidatorHelper.validateRequired,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChangedText: controller.onChangedText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormFieldOutlineWidget(
                    hint: 'Expired Date MM/YY',
                    keyboardType: TextInputType.text,
                    controller: controller.expiredCCPaymentController,
                    validator: TextFieldValidatorHelper.validateRequired,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChangedText: controller.onChangedText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormFieldOutlineWidget(
                    hint: 'CVC/CVV',
                    keyboardType: TextInputType.number,
                    controller: controller.CVVPaymentController,
                    validator: TextFieldValidatorHelper.validateRequired,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChangedText: controller.onChangedText,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: theme.black50,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      const TextSpan(
                          text:
                              'By clicking on "Continue", you agree to pay the total amount shown, which includes Service Fees, on the right and to the '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(
                          color: theme.main50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(text: ', Guest '),
                      TextSpan(
                        text: 'Refund Policy',
                        style: TextStyle(
                          color: theme.main50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(text: ', '),
                      TextSpan(
                        text: 'Cancellation Policy',
                        style: TextStyle(
                          color: theme.main50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ButtonBasicWidget(
                    text: 'Submit',
                    isFullWidht: true,
                    enable: controller.isEnabledSubmitButton,
                    onTap: () async {
                      // Get.toNamed(Routes.PAYMENT);
                      Get.back();
                      await controller.onSubmit();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
