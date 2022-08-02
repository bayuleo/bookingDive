import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'confirmation_refund_modal_bottom_widget.dart';
import 'ticket_modal_bottom_widget.dart';

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
