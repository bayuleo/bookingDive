import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/modules/profile/payment/list_payment_method/list_payment_method_controller.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/widgets/text/text_basic_widget.dart';

class ListPaymentMethodScreen extends BaseView<ListPaymentMethodController> {
  const ListPaymentMethodScreen({Key? key}) : super(key: key);

  final isHaveValue = true;

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Payment Method',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: isHaveValue
            ? SingleChildScrollView(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemPaymentMethodWidget();
                  },
                ),
              )
            : EmptyStateWidget(context),
      ),
    );
  }

  Stack EmptyStateWidget(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextBasicWidget(
            text:
                'Manage your payments to increase the security and convenience of your shopping.',
            weight: FontWeight.w400,
            color: theme.black30,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.emptyStateListPaymentMethod
                .image(width: MediaQuery.of(context).size.width * 0.3),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: TextBasicWidget(
                text: 'No Payment Method ',
                size: 18,
                weight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 16),
              child: TextBasicWidget(
                text: 'You have not add any payment method yet',
                size: 16,
                weight: FontWeight.w400,
                color: theme.black30,
                textAlign: TextAlign.center,
              ),
            ),
            ButtonBasicWidget(
              text: 'Add Payment Method',
              onTap: () {
                Get.toNamed(Routes.ADD_PAYMENT_METHOD);
              },
            )
          ],
        ),
      ],
    );
  }
}

class LabelActiveWidget extends StatelessWidget with BaseWidgetMixin {
  final bool isActive;
  const LabelActiveWidget({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: theme.white,
        border: Border.all(color: isActive ? theme.main70 : theme.black10),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextBasicWidget(
        text: isActive ? 'Active' : 'Inactive',
        color: isActive ? theme.main70 : theme.black30,
        weight: FontWeight.w600,
        size: 12,
      ),
    );
  }
}

class ItemPaymentMethodWidget extends StatelessWidget with BaseWidgetMixin {
  const ItemPaymentMethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: theme.white,
          border: Border.all(color: theme.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: TextBasicWidget(
                          text: 'PAYPAL',
                          size: 14,
                          weight: FontWeight.w600,
                          color: theme.black50,
                        ),
                      ),
                      LabelActiveWidget(),
                    ],
                  ),
                  TextBasicWidget(
                    text: 'Edit',
                    color: theme.main70,
                    textDecoration: TextDecoration.underline,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBasicWidget(
                  text: 'mail@domain.com',
                  size: 14,
                  weight: FontWeight.w400,
                ),
                TextBasicWidget(
                  text: 'Remove',
                  size: 14,
                  weight: FontWeight.w400,
                  color: theme.main70,
                  textDecoration: TextDecoration.underline,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
