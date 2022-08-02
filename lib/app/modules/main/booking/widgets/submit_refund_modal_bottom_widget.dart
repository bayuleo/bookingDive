import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
