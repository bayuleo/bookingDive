import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/widgets/text/text_basic_widget.dart';
import 'add_payment_method_controller.dart';

class AddPaymentMethodScreen extends BaseView<AddPaymentMethodController> {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  final String? valueDummy = '1';

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Payment Method',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: valueDummy,
                          groupValue: valueDummy,
                          activeColor: theme.main30,
                          onChanged: null),
                      TextBasicWidget(
                        text: 'Bank Account',
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: valueDummy,
                          groupValue: valueDummy,
                          activeColor: theme.main30,
                          onChanged: null),
                      TextBasicWidget(
                        text: 'Paypal Account',
                      )
                    ],
                  ),
                ],
              ),
              ListPaymentMethod(label: 'Bank name'),
              ListPaymentMethod(label: 'Bank account holder name'),
              ListPaymentMethod(label: 'Bank account number/IBAN'),
              ListPaymentMethod(label: 'Branch name'),
              ListPaymentMethod(label: 'Branch city'),
              ListPaymentMethod(label: 'Branch address'),
              ListPaymentMethod(label: 'Swift code'),
              ListPaymentMethod(label: 'Country'),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 24),
                child: ButtonBasicWidget(
                  text: 'Add Payment Method',
                  isFullWidht: true,
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding ListPaymentMethod({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormFieldOutlineWidget(
        hint: label,
      ),
    );
  }
}
