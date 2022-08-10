import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/main/home/home_controller.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetDiverWidget extends StatelessWidget with BaseWidgetMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              color: theme.white,
              borderRadius: const BorderRadius.only(
                topRight: const Radius.circular(20),
                topLeft: const Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  blurRadius: 9,
                  color: Colors.black.withOpacity(0.2),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 52),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  child: TextBasicWidget(
                    text: 'Number of diver',
                    size: 18,
                    weight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 32),
                  child: const Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: controller.numberDiverInput > 0
                              ? InkWell(
                                  onTap: () {
                                    controller.numberDiverInput--;
                                    controller.update();
                                  },
                                  child:
                                      Assets.icons.buttonDownActiveIcon.svg())
                              : Assets.icons.buttonDownIcon.svg()),
                      Expanded(
                        flex: 3,
                        child: TextFormFieldOutlineWidget(
                          hint: controller.numberDiverInput.toString(),
                          textAlign: TextAlign.center,
                          controller: controller.diverInputController,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            controller.numberDiverInput++;
                            controller.update();
                          },
                          child: Assets.icons.buttonUpActiveIcon.svg(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: ButtonBasicWidget(
                    text: 'Submit',
                    isFullWidht: true,
                    onTap: () {
                      controller.diverTextEditingController.text =
                          controller.numberDiverInput == 0
                              ? ''
                              : controller.numberDiverInput.toString();
                      controller.update();
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
        );
      },
    );
  }
}
