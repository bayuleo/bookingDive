import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/modules/main/home/home_controller.dart';
import 'package:bookingdive/app/modules/main/home/widgets/bottom_sheet_destination/bottom_sheet_date_widget.dart';
import 'package:bookingdive/app/modules/main/home/widgets/bottom_sheet_destination/bottom_sheet_destination_widget.dart';
import 'package:bookingdive/app/modules/main/home/widgets/bottom_sheet_destination/bottom_sheet_diver_widget.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/text/text_field_outline_widget.dart';

class SearchSectionWidget extends StatelessWidget with BaseWidgetMixin {
  const SearchSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: theme.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 9,
                  color: Colors.black.withOpacity(0.2),
                )
              ]),
          child: Column(
            children: [
              TextFormFieldOutlineWidget(
                hint: 'Destination',
                controller: controller.destinationTextEditingController,
                leftIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.destinationIcon.svg(),
                ),
                readOnly: true,
                rightIcon: Assets.icons.downStrokeIcon
                    .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
                onTap: () => showBottomSheetDestination(
                  context,
                  BottomSheetDestinationWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextFormFieldOutlineWidget(
                  hint: 'Date',
                  leftIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.icons.dateIcon.svg(),
                  ),
                  controller: controller.dateTextEditingController,
                  readOnly: true,
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
                  controller: controller.diverTextEditingController,
                  readOnly: true,
                  rightIcon: Assets.icons.downStrokeIcon
                      .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
                  onTap: () {
                    controller.numberDiverInput = (controller
                                .diverTextEditingController.text
                                .trim() !=
                            '')
                        ? int.parse(
                            controller.diverTextEditingController.text.trim())
                        : 0;
                    showBottomSheetDestination(
                      context,
                      BottomSheetDiverWidget(),
                    );
                  },
                ),
              ),
              ButtonBasicWidget(
                text: 'Search',
                isFullWidht: true,
                onTap: () {
                  Get.toNamed(
                    Routes.SEARCH,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
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
