import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
