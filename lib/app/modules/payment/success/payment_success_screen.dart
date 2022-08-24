import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/payment/success/payment_success_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PaymentSuccessScreen extends BaseView<PaymentSuccessController> {
  @override
  Widget buildScreen(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Payment Verification',
          onTapLeftIcon: () {
            Get.offAllNamed(Routes.MAIN_CONTENT);
          },
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.paymentSuccess.svg(),
                TextBasicWidget(
                  text: 'Your payment is successful',
                  size: 18,
                  weight: FontWeight.w700,
                  color: theme.black50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 24),
                  child: TextBasicWidget(
                    text:
                        'Your payment is confirmed. We have sent you your e-Ticket',
                    size: 16,
                    weight: FontWeight.w400,
                    color: theme.black30,
                    textAlign: TextAlign.center,
                  ),
                ),
                ButtonBasicWidget(
                  text: 'View e-Ticket',
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        Get.offAllNamed(Routes.MAIN_CONTENT);
        return true;
      },
    );
  }
}
