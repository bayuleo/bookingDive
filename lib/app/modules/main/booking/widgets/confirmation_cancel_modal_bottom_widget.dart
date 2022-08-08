import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationCancelModalBottomWidget extends StatelessWidget
    with BaseWidgetMixin {
  const ConfirmationCancelModalBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
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
            const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextBasicWidget(
              text: 'Are you sure you want to cancel your payment?',
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
                      text: 'No',
                      padding: const EdgeInsets.symmetric(vertical: 12),
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
                      text: 'Yes',
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      onTap: () {
                        Get.back();
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return Container();
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
