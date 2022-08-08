import 'package:bookingdive/app/core/base/base_controller.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/data/model/payment/response_payment_profile.dart';
import 'package:bookingdive/app/data/repository/payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentMethodController extends BaseController {
  final PaymentRepository _paymentRepository = Get.find();
  final cardNumberTextEditingController = TextEditingController();

  @override
  void onReady() {
    cardNumberTextEditingController.text = Get.arguments ?? '';
    update();
    super.onReady();
  }

  @override
  void onClose() {
    cardNumberTextEditingController.dispose();
    super.onClose();
  }

  Future<void> postDataPaymentProfile() async {
    await callDataService<ResponsePaymentProfile>(
      () => _paymentRepository.postPaymentProfile(
        RequestAddPaymentProfile(
          cardNumber: cardNumberTextEditingController.value.text.trim(),
        ),
      ),
      onSuccess: (res) {
        Get.back();
      },
    );
  }
}
