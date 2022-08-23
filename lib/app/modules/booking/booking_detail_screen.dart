import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/utils/currency.dart';
import 'package:bookingdive/app/core/utils/date.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/booking/widgets/selector_booking_payment_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'booking_detail_controller.dart';

class BookingDetailScreen extends BaseView<BookingDetailController> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Booking Details',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 24, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.network(
                      controller.data?.package?.image ??
                          'https://dummyimage.com/200x100/000/fff',
                      width: 105,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBasicWidget(
                        text: controller.data?.location?.locationName ?? '',
                        weight: FontWeight.w600,
                        size: 14,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextBasicWidget(
                          text: controller.data?.package?.packageName ?? '',
                          weight: FontWeight.w400,
                          size: 12,
                          color: theme.black30,
                        ),
                      ),
                      TextBasicWidget(
                        text:
                            '${controller.data?.package?.dayCount ?? ''} Days ${controller.data?.package?.nightCount ?? ''} Night •  ${controller.data?.package?.diveCount ?? ''} Dives  •  ${controller.data?.package?.minimumDiver ?? ''} Divers',
                        weight: FontWeight.w400,
                        size: 10,
                        color: theme.black50,
                      )
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: theme.disable,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBasicWidget(
                          text: 'Start',
                          color: theme.black50,
                        ),
                        TextBasicWidget(
                          text: controller.data?.location?.date ?? '',
                          color: theme.black30,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBasicWidget(
                        text: 'End',
                        color: theme.black50,
                      ),
                      TextBasicWidget(
                        text: DateHelper.getNextDateFromString(
                          controller.data?.location?.date,
                          int.parse(controller.data?.package?.dayCount ?? '0'),
                        ),
                        color: theme.black30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.userCredentials?.accessToken == null,
              child: Divider(
                thickness: 4,
                height: 4,
                color: theme.disable,
              ),
            ),
            Visibility(
              visible: controller.userCredentials?.accessToken == null,
              child: Container(
                margin: EdgeInsets.zero,
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                color: theme.main10,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Assets.icons.lockBlueIcon.svg(),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => controller.goToLogin(),
                            text: 'Login',
                            style: TextStyle(
                              color: theme.main50,
                            ),
                          ),
                          const TextSpan(text: ' or '),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => controller.goToRegister(),
                            text: 'Register',
                            style: TextStyle(
                              color: theme.main50,
                            ),
                          ),
                          const TextSpan(
                              text: ' to manage and auto fill your order'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 4,
              height: 4,
              color: theme.disable,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.black10),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Assets.icons.refreshIcon.svg(),
                        ),
                        TextBasicWidget(
                          text: 'Refund Policy: ',
                          weight: FontWeight.w600,
                          color: theme.black50,
                        ),
                        TextBasicWidget(
                          text: 'Flexible',
                          weight: FontWeight.w400,
                          color: theme.main70,
                        ),
                      ],
                    ),
                    TextBasicWidget(
                      text: 'Details',
                      weight: FontWeight.w400,
                      color: theme.main70,
                      textDecoration: TextDecoration.underline,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 4,
              color: theme.disable,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextBasicWidget(
                    text: 'Diver Detail - 1',
                    weight: FontWeight.w700,
                    size: 16,
                    color: Colors.black,
                  ),
                  Row(
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
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: const TextFormFieldOutlineWidget(
                      hint: 'First name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: const TextFormFieldOutlineWidget(
                      hint: 'Last name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'Phone Number',
                    ),
                  ),
                  const TextFormFieldOutlineWidget(
                    hint: 'Certificate Number',
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: theme.disable,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: const TextBasicWidget(
                      text: 'Diver Detail - 2',
                      weight: FontWeight.w700,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'First name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: const TextFormFieldOutlineWidget(
                      hint: 'Last name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: const TextFormFieldOutlineWidget(
                      hint: 'Phone Number',
                    ),
                  ),
                  const TextFormFieldOutlineWidget(
                    hint: 'Certificate Number',
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: theme.disable,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextBasicWidget(
                        text: 'Total ',
                        weight: FontWeight.w400,
                        color: theme.black30,
                      ),
                      TextBasicWidget(
                        text:
                            '${controller.data?.currency ?? ''} ${(controller.data?.package?.price ?? '').addComma()}',
                        weight: FontWeight.w700,
                        color: theme.main50,
                        size: 16,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ButtonBasicWidget(
                        text: 'Payment',
                        isFullWidht: true,
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return const SelectorBookingPaymentWidget();
                            },
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
