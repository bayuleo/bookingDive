import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
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
            ?
            // ? SingleChildScrollView(
            //     child: ListView.builder(
            //       padding: EdgeInsets.only(top: 16),
            //       physics: NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemCount: 9,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ItemPaymentMethodWidget();
            //       },
            //     ),
            //   )
            Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Assets.images.creditCard.image(
                            width: MediaQuery.of(context).size.width * 0.4),
                        TextBasicWidget(
                          text: 'Credit Card Number',
                          size: 16,
                          weight: FontWeight.w700,
                          color: theme.black30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextBasicWidget(
                            text: '143415135658694142325',
                            size: 18,
                            weight: FontWeight.w500,
                            color: theme.black70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ButtonOutlineBasicWidget(
                                isFullWidht: true,
                                text: 'Remove',
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (_) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 32, horizontal: 24),
                                        decoration: BoxDecoration(
                                          color: theme.white,
                                          border:
                                              Border.all(color: theme.white),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextBasicWidget(
                                              text: 'Remove Credit Card?',
                                              size: 18,
                                              weight: FontWeight.w500,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 24, bottom: 24),
                                              child: TextBasicWidget(
                                                text:
                                                    'This action cannot be undone',
                                                size: 14,
                                                weight: FontWeight.w400,
                                                color: theme.black50,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child:
                                                        ButtonOutlineBasicWidget(
                                                      isFullWidht: true,
                                                      text: 'Cancel',
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    child: ButtonBasicWidget(
                                                      isFullWidht: true,
                                                      text: 'Remove',
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: ButtonBasicWidget(
                                isFullWidht: true,
                                text: 'Change Card',
                                onTap: () {
                                  Get.toNamed(Routes.ADD_PAYMENT_METHOD);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : EmptyStateWidget(),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget with BaseWidgetMixin {
  const EmptyStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextBasicWidget(
            text: 'Add your Credit Card to increase your shopping convenience.',
            weight: FontWeight.w400,
            color: theme.black30,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.emptyStateListPaymentMethod
                .image(width: MediaQuery.of(context).size.width * 0.3),
            const Padding(
              padding: EdgeInsets.only(
                top: 24,
              ),
              child: TextBasicWidget(
                text: 'No Card Found ',
                size: 18,
                weight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 16),
              child: TextBasicWidget(
                text: 'You haven`t added a credit card',
                size: 16,
                weight: FontWeight.w400,
                color: theme.black30,
                textAlign: TextAlign.center,
              ),
            ),
            ButtonBasicWidget(
              text: 'Add Credit Card',
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
                      LabelActiveWidget(
                        isActive: true,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 32),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBasicWidget(
                                  text: 'Delete Payment Method',
                                  weight: FontWeight.w500,
                                  size: 18,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 24),
                                  child: TextBasicWidget(
                                    text: 'This action cannot be undone',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: ButtonOutlineBasicWidget(
                                            isFullWidht: true,
                                            text: 'Cancel',
                                            onTap: () {
                                              Get.back();
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: ButtonBasicWidget(
                                            isFullWidht: true,
                                            text: 'Delete',
                                            onTap: () {
                                              Get.toNamed(
                                                  Routes.ADD_PAYMENT_METHOD);
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: TextBasicWidget(
                      text: 'Edit',
                      color: theme.main70,
                      textDecoration: TextDecoration.underline,
                    ),
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
