import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/payment/payment_controller.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentScreen extends BaseView<PaymentController> {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Payment Verification',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.paymentWaitingIcon.svg(),
              TextBasicWidget(
                text: 'We’ve received your order!',
                size: 18,
                weight: FontWeight.w700,
                color: theme.black50,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 24),
                child: TextBasicWidget(
                  text:
                      'We need time to check your payment. See payment status by clicking the button below',
                  size: 16,
                  weight: FontWeight.w400,
                  color: theme.black30,
                  textAlign: TextAlign.center,
                ),
              ),
              ButtonBasicWidget(
                text: 'View Payment Status',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
