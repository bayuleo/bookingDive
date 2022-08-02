import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBookingWidget extends StatelessWidget with BaseWidgetMixin {
  const ItemBookingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
                color: theme.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 6),
                    blurRadius: 7,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ]),
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.images.loginBanner.image(width: 45, height: 30),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                        color: theme.disable,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 0.5,
                          color: theme.disable,
                        ),
                      ),
                      child: TextBasicWidget(
                        text: '22 July 2022 - 25 July 2022',
                        color: theme.main90,
                        weight: FontWeight.w400,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 4),
                  child: TextBasicWidget(
                    text: 'Booking ID: 214567867968087',
                    size: 12,
                    color: theme.black30,
                    weight: FontWeight.w400,
                  ),
                ),
                TextBasicWidget(
                  text: 'Universal Diver',
                  size: 18,
                  weight: FontWeight.w500,
                  color: theme.black50,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextBasicWidget(
                    text: 'Universal Diver',
                    size: 12,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: TextBasicWidget(
                    text: 'Hide Details',
                    size: 12,
                    color: theme.main50,
                    textDecoration: TextDecoration.underline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Assets.icons.calendarIcon.svg(),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: TextBasicWidget(
                              text: 'Days: ',
                              size: 12,
                              color: theme.black50,
                            ),
                          ),
                          TextBasicWidget(
                            text: '3 Days 2 Nights',
                            size: 12,
                            weight: FontWeight.w700,
                            color: theme.black70,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Assets.icons.anchorIcon.svg(),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: TextBasicWidget(
                                text: 'Number of Dive: ',
                                size: 12,
                                color: theme.black50,
                              ),
                            ),
                            TextBasicWidget(
                              text: '4 Dives',
                              size: 12,
                              weight: FontWeight.w700,
                              color: theme.black70,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Assets.icons.peopleIcon.svg(),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: TextBasicWidget(
                              text: 'Number of Divers: ',
                              size: 12,
                              color: theme.black50,
                            ),
                          ),
                          TextBasicWidget(
                            text: '2 Divers',
                            size: 12,
                            weight: FontWeight.w700,
                            color: theme.black70,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    children: [
                      TextBasicWidget(
                        text: 'IDR 500,000',
                        size: 14,
                        weight: FontWeight.w600,
                        color: theme.black50,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: theme.success10,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 0.5,
                            color: theme.success10,
                          ),
                        ),
                        child: TextBasicWidget(
                          text: 'Payment Success',
                          color: theme.success70,
                          weight: FontWeight.w400,
                          size: 12,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: ButtonBasicWidget(
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          text: 'View e-Ticket',
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return TicketModalBottomWidget();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ButtonOutlineBasicWidget(
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          text: 'Refund',
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return ConfirmationRefundModalBottomWidget();
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ConfirmationRefundModalBottomWidget extends StatelessWidget
    with BaseWidgetMixin {
  const ConfirmationRefundModalBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 9,
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextBasicWidget(
              text: 'Are you sure you want to refund?',
              size: 18,
              weight: FontWeight.w500,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: TextBasicWidget(
                text: 'This action cannot be undone',
                size: 14,
                weight: FontWeight.w400,
                color: theme.black50,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ButtonOutlineBasicWidget(
                      text: 'Cancel',
                      padding: EdgeInsets.symmetric(vertical: 12),
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: ButtonBasicWidget(
                      text: 'Refund',
                      padding: EdgeInsets.symmetric(vertical: 12),
                      onTap: () {
                        Get.back();
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return RefundFormModalBottomWidget();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RefundFormModalBottomWidget extends StatelessWidget with BaseWidgetMixin {
  const RefundFormModalBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 9,
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 42),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextBasicWidget(
                text: 'Refund Form',
                size: 18,
                weight: FontWeight.w500,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Booking ID',
                  label: Text('Booking ID'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Choose bank',
                  label: Text('Bank'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Fill in your account number',
                  label: Text('Account number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: TextFormFieldOutlineWidget(
                  hint: 'Fill in your account holder’s name',
                  label: Text('Account holder’s name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: ButtonOutlineBasicWidget(
                          text: 'Cancel',
                          padding: EdgeInsets.symmetric(vertical: 12),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ButtonBasicWidget(
                          text: 'Refund',
                          padding: EdgeInsets.symmetric(vertical: 12),
                          onTap: () {
                            Get.back();
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (_) {
                                return SubmittedRefundModalBottomWidget();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmittedRefundModalBottomWidget extends StatelessWidget
    with BaseWidgetMixin {
  const SubmittedRefundModalBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 9,
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextBasicWidget(
              text: 'Refund form submitted!',
              size: 18,
              weight: FontWeight.w500,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: TextBasicWidget(
                text:
                    'Please wait while we process your refund request. It may take 1-2 days.',
                size: 14,
                weight: FontWeight.w400,
                color: theme.black50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: ButtonBasicWidget(
                isFullWidht: true,
                text: 'Okay',
                padding: EdgeInsets.symmetric(vertical: 12),
                onTap: () {
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TicketModalBottomWidget extends StatelessWidget with BaseWidgetMixin {
  const TicketModalBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 9,
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 42),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextBasicWidget(
                text: 'E-Ticket',
                size: 18,
                weight: FontWeight.w500,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Ticket ID',
                  label: Text('Ticket ID'),
                ),
              ),
              Assets.images.loginBanner.image(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 32),
                child: ButtonOutlineBasicWidget(
                  isFullWidht: true,
                  text: 'Close e-Ticket',
                  padding: EdgeInsets.symmetric(vertical: 12),
                  onTap: () {
                    Get.back();
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
      ),
    );
  }
}
