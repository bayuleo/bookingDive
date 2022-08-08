import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'submit_refund_modal_bottom_widget.dart';

class RefundFormModalBottomWidget extends StatelessWidget with BaseWidgetMixin {
  const RefundFormModalBottomWidget({
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextBasicWidget(
                text: 'Refund Form',
                size: 18,
                weight: FontWeight.w500,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32, bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Booking ID',
                  label: Text('Booking ID'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Choose bank',
                  label: Text('Bank'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Fill in your account number',
                  label: Text('Account number'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 32),
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
                          text: 'Refund',
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          onTap: () {
                            Get.back();
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (_) {
                                return const SubmittedRefundModalBottomWidget();
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
