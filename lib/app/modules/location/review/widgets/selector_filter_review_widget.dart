import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/list/list_radio_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/location/review/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectorFilterReviewWidget extends StatelessWidget with BaseWidgetMixin {
  SelectorFilterReviewWidget({Key? key}) : super(key: key);

  var dummyValRadio = '1';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewController>(
      builder: (controller) {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBasicWidget(
                        text: 'Filter',
                        size: 18,
                        weight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      TextBasicWidget(
                        text: 'Reset',
                        size: 18,
                        weight: FontWeight.w500,
                        color: theme.main50,
                      ),
                    ],
                  ),
                ),
                ListRadioWidget(
                  groupValue: controller.filterRating,
                  value: '0',
                  label: 'All (12)',
                  onChanged: (value) {
                    controller.onTapFilter("0");
                  },
                ),
                ListRadioWidget(
                  groupValue: controller.filterRating,
                  value: '5',
                  label: '5-stars (10 not set)',
                  onChanged: (value) {
                    controller.onTapFilter("5");
                  },
                ),
                ListRadioWidget(
                  groupValue: controller.filterRating,
                  value: '4',
                  label: '4-stars (1 not set)',
                  onChanged: (value) {
                    controller.onTapFilter("4");
                  },
                ),
                ListRadioWidget(
                  groupValue: controller.filterRating,
                  value: '3',
                  label: '3-stars (0 not set)',
                  onChanged: (value) {
                    controller.onTapFilter("3");
                  },
                ),
                ListRadioWidget(
                  groupValue: controller.filterRating,
                  value: '2',
                  label: '2-stars (0 not set)',
                  onChanged: (value) {
                    controller.onTapFilter("2");
                  },
                ),
                ListRadioWidget(
                  groupValue: controller.filterRating,
                  value: '1',
                  label: '1-stars (0 not set)',
                  onChanged: (value) {
                    controller.onTapFilter("1");
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ButtonBasicWidget(
                    text: 'Apply Filter',
                    isFullWidht: true,
                    onTap: () {
                      Get.back();
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
