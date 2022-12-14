import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:flutter/material.dart';

import 'booking_controller.dart';
import 'widgets/item_booking_widget.dart';

class BookingScreen extends BaseView<BookingController> {
  const BookingScreen({Key? key}) : super(key: key);
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'My Booking',
        showBackButton: false,
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 16, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonOutlineBasicWidget(
                  text: 'Upcoming',
                  fontWeight: FontWeight.w400,
                  enable: controller.tabActive == 1,
                  forceOnTap: true,
                  disableColor: theme.black30,
                  radius: 20,
                  onTap: () {
                    controller.onTapTab(1);
                  },
                ),
                ButtonOutlineBasicWidget(
                  text: 'Cancelled',
                  fontWeight: FontWeight.w400,
                  enable: controller.tabActive == 2,
                  disableColor: theme.black30,
                  forceOnTap: true,
                  radius: 20,
                  onTap: () {
                    controller.onTapTab(2);
                  },
                ),
                ButtonOutlineBasicWidget(
                  text: 'Completed',
                  fontWeight: FontWeight.w400,
                  enable: controller.tabActive == 3,
                  forceOnTap: true,
                  disableColor: theme.black30,
                  radius: 20,
                  onTap: () {
                    controller.onTapTab(3);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                ItemBookingWidget(data: controller.data ?? []),
                Text('test2'),
                Text('test3'),
                // ItemBookingWidget(),
                // ItemBookingWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
