import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/time.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchBottomDateWidget extends StatelessWidget with BaseWidgetMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              color: theme.white,
              borderRadius: const BorderRadius.only(
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
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: TextBasicWidget(
                    text: 'Check in date',
                    size: 18,
                    weight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Divider(),
                ),
                CalendarDatePicker(
                  initialDate: controller.dateTextEditingController.text == ''
                      ? DateTime.now()
                      : DateFormat('dd MMMM yyyy')
                          .parse(controller.dateTextEditingController.text),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  onDateChanged: (DateTime value) {
                    controller.dateTextEditingController.text =
                        TimeHelper.formatDate(value, 'dd MMMM yyyy');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
