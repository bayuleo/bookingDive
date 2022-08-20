import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/location/loaction_controller.dart';
import 'package:bookingdive/app/modules/main/home/widgets/bottom_sheet_destination/bottom_sheet_date_widget.dart';
import 'package:bookingdive/app/modules/main/home/widgets/bottom_sheet_destination/bottom_sheet_diver_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/button/button_basic_widget.dart';
import '../../../core/widgets/text/text_field_outline_widget.dart';

class SelectorSearchWidget extends StatefulWidget {
  const SelectorSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectorSearchWidget> createState() => _SelectorSearchWidgetState();
}

class _SelectorSearchWidgetState extends State<SelectorSearchWidget>
    with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (controller) {
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextBasicWidget(
                  text: 'Search',
                  weight: FontWeight.w500,
                  size: 18,
                  color: theme.black90,
                ),
              ),
              // TextFormFieldOutlineWidget(
              //   hint: 'Destination',
              //   leftIcon: Padding(
              //     padding: const EdgeInsets.all(12.0),
              //     child: Assets.icons.destinationIcon.svg(),
              //   ),
              //   controller:
              //       controller.homeController.destinationTextEditingController,
              //   readOnly: true,
              //   rightIcon: Assets.icons.downStrokeIcon
              //       .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
              //   onTap: () => showBottomSheetDestination(
              //     context,
              //     BottomSheetDestinationWidget(),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Date',
                  leftIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.dateIcon.svg(),
                  ),
                  readOnly: true,
                  controller:
                      controller.homeController.dateTextEditingController,
                  rightIcon: Assets.icons.downStrokeIcon
                      .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
                  onTap: () => showBottomSheetDestination(
                    context,
                    BottomSheetDateWidget(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Number of diver',
                  leftIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.personInactiveIcon.svg(),
                  ),
                  readOnly: true,
                  controller:
                      controller.homeController.diverTextEditingController,
                  rightIcon: Assets.icons.downStrokeIcon
                      .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
                  onTap: () => showBottomSheetDestination(
                    context,
                    BottomSheetDiverWidget(),
                  ),
                ),
              ),
              ButtonBasicWidget(
                text: 'Search',
                isFullWidht: true,
                onTap: () {
                  controller.getDetailLocation();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Future<dynamic> showBottomSheetDestination(
      BuildContext context, Widget child) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return child;
      },
    );
  }
}
