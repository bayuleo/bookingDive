import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/booking/widgets/selector_booking_payment_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'booking_detail_controller.dart';

class BookingDetailScreen extends BaseView<BookingDetailController> {
  final bool dummyCheckbox = false;
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
                    child: Assets.images.loginBanner.image(width: 105),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBasicWidget(
                        text: 'Scuba Diving Courses and Fun Dives',
                        weight: FontWeight.w600,
                        size: 14,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextBasicWidget(
                          text: 'Refresher Dive',
                          weight: FontWeight.w400,
                          size: 12,
                          color: theme.black30,
                        ),
                      ),
                      TextBasicWidget(
                        text: '3 Days 1 Night  •  4 Dives  •  2 Divers',
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
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                          text: '22 July 2022',
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
                        text: '25 July 2022',
                        color: theme.black30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              height: 4,
              color: theme.disable,
            ),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
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
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: theme.main50,
                          ),
                        ),
                        TextSpan(text: ' or '),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: theme.main50,
                          ),
                        ),
                        TextSpan(text: ' to manage and auto fill your order'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              height: 4,
              color: theme.disable,
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Container(
                padding: EdgeInsets.all(12),
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
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBasicWidget(
                    text: 'Diver Detail - 1',
                    weight: FontWeight.w700,
                    size: 16,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Checkbox(value: dummyCheckbox, onChanged: null),
                      TextBasicWidget(
                        text: 'Use login information',
                        weight: FontWeight.w400,
                        size: 14,
                        color: theme.black50,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'First name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'Last name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'Phone Number',
                    ),
                  ),
                  TextFormFieldOutlineWidget(
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
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextBasicWidget(
                      text: 'Diver Detail - 2',
                      weight: FontWeight.w700,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'First name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'Last name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormFieldOutlineWidget(
                      hint: 'Phone Number',
                    ),
                  ),
                  TextFormFieldOutlineWidget(
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
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                        text: 'IDR 214.234',
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
                              return SelectorBookingPaymentWidget();
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
