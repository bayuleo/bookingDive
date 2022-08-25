import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/currency.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/data/model/order/response_list_order_data.dart';
import 'package:bookingdive/app/modules/main/booking/booking_controller.dart';
import 'package:bookingdive/app/modules/main/booking/widgets/confirmation_cancel_modal_bottom_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemBookingWidget extends StatelessWidget with BaseWidgetMixin {
  final List<ResponseListOrderData> data;
  ItemBookingWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              var item = data[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                    color: theme.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(5, 6),
                        blurRadius: 7,
                        spreadRadius: 1,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ]),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          item.package.image,
                          width: 45,
                          height: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            color: theme.disable,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              width: 0.5,
                              color: theme.disable,
                            ),
                          ),
                          child: TextBasicWidget(
                            text: '22 July 2022 - 25 July 2022 NOT SET',
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
                        text: 'Booking ID: ${item.orderId}',
                        size: 12,
                        color: theme.black30,
                        weight: FontWeight.w400,
                      ),
                    ),
                    TextBasicWidget(
                      text: item.productName,
                      size: 18,
                      weight: FontWeight.w500,
                      color: theme.black50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextBasicWidget(
                        text: '${item.locationState}, ${item.locationCountry}',
                        size: 12,
                        weight: FontWeight.w400,
                        color: theme.black50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: InkWell(
                        onTap: controller.changeShowDetail,
                        child: TextBasicWidget(
                          text: controller.isHideDetail
                              ? 'Show Details'
                              : 'Hide Details',
                          size: 12,
                          color: theme.main50,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.isHideDetail,
                      child: Padding(
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
                                  text:
                                      '${item.package.dayCount} Days ${item.package.nightCount} Nights',
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
                                    text: '${item.package.diveCount} Dives',
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
                                  text: '${item.package.minimumDiver} Divers',
                                  size: 12,
                                  weight: FontWeight.w700,
                                  color: theme.black70,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          TextBasicWidget(
                            text: 'NOT SET ${item.grandTotal.addComma()}',
                            size: 14,
                            weight: FontWeight.w600,
                            color: theme.black50,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: theme.success10,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 0.5,
                                color: theme.success10,
                              ),
                            ),
                            child: TextBasicWidget(
                              text: 'Payment Success NOT SET',
                              color: theme.success70,
                              weight: FontWeight.w400,
                              size: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    //View Ticket
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(right: 4),
                    //         child: ButtonBasicWidget(
                    //           padding:
                    //               const EdgeInsets.only(top: 12, bottom: 12),
                    //           text: 'View e-Ticket',
                    //           onTap: () {
                    //             showModalBottomSheet(
                    //               backgroundColor: Colors.transparent,
                    //               isScrollControlled: true,
                    //               context: context,
                    //               builder: (_) {
                    //                 return const TicketModalBottomWidget();
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 4),
                    //         child: ButtonOutlineBasicWidget(
                    //           padding:
                    //               const EdgeInsets.only(top: 12, bottom: 12),
                    //           text: 'Refund',
                    //           onTap: () {
                    //             showModalBottomSheet(
                    //               backgroundColor: Colors.transparent,
                    //               context: context,
                    //               builder: (_) {
                    //                 return const ConfirmationRefundModalBottomWidget();
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    //Write Review
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(right: 4),
                    //         child: ButtonBasicWidget(
                    //           padding:
                    //               const EdgeInsets.only(top: 12, bottom: 12),
                    //           text: 'Write Review',
                    //           onTap: () {
                    //             showModalBottomSheet(
                    //               backgroundColor: Colors.transparent,
                    //               isScrollControlled: true,
                    //               context: context,
                    //               builder: (_) {
                    //                 return const ReviewModalBottomWidget();
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 4),
                    //         child: ButtonOutlineBasicWidget(
                    //           padding:
                    //               const EdgeInsets.only(top: 12, bottom: 12),
                    //           text: 'Book Again',
                    //           onTap: () {
                    //             showModalBottomSheet(
                    //               backgroundColor: Colors.transparent,
                    //               context: context,
                    //               builder: (_) {
                    //                 return const Text('');
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    //Book Again
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 12),
                    //   child: ButtonBasicWidget(
                    //     isFullWidht: true,
                    //     text: 'Book Again',
                    //     onTap: () {},
                    //   ),
                    // ),
                    //Cancel
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: ButtonOutlineBasicWidget(
                        isFullWidht: true,
                        text: 'Cancel Payment',
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return const ConfirmationCancelModalBottomWidget();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
