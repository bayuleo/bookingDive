import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';
import 'package:bookingdive/app/core/widgets/bottom_sheet_selector/bottom_sheet_selector_widget.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/button/button_basic_widget.dart';

class SearchSectionWidget extends StatelessWidget with BaseWidgetMixin {
  final Function? onTapDestination;
  final BottomSheetSelectorController bottomSheetSelectorController;

  const SearchSectionWidget({
    Key? key,
    this.onTapDestination,
    required this.bottomSheetSelectorController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          // Input Destination
          BottomSheetSelectorWidget(
            selectorController: bottomSheetSelectorController,
            hint: 'Destination',
            leftIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Assets.icons.destinationIcon.svg(),
            ),
            selectorType: SelectorType.Destination,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16),
          //   child: TextFormFieldOutlineWidget(
          //     hint: 'Date',
          //     leftIcon: Padding(
          //       padding: const EdgeInsets.all(12.0),
          //       child: Assets.icons.dateIcon.svg(),
          //     ),
          //     rightIcon: Assets.icons.downStrokeIcon
          //         .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
          //     readOnly: true,
          //   ),
          // ),
          // Input Date
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: BottomSheetSelectorWidget(
              selectorController: bottomSheetSelectorController,
              hint: 'Date',
              leftIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.dateIcon.svg(),
              ),
              selectorType: SelectorType.Date,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 16),
          //   child: TextFormFieldOutlineWidget(
          //     hint: 'Number of diver',
          //     leftIcon: Padding(
          //       padding: const EdgeInsets.all(12.0),
          //       child: Assets.icons.personIcon.svg(),
          //     ),
          //     rightIcon: Assets.icons.downStrokeIcon
          //         .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: BottomSheetSelectorWidget(
              selectorController: bottomSheetSelectorController,
              hint: 'Number of diver',
              leftIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.personInactiveIcon.svg(),
              ),
              selectorType: SelectorType.NumberDiver,
            ),
          ),
          ButtonBasicWidget(
            text: 'Search',
            isFullWidht: true,
            onTap: () {
              Get.toNamed(Routes.SEARCH);
            },
          ),
        ],
      ),
    );
  }
}
