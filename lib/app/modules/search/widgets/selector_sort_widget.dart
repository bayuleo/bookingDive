import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/button/button_basic_widget.dart';
import '../../../core/widgets/list/list_radio_widget.dart';

class SelectorSortWidget extends StatefulWidget {
  const SelectorSortWidget({Key? key}) : super(key: key);

  @override
  State<SelectorSortWidget> createState() => _SelectorSortWidgetState();
}

class _SelectorSortWidgetState extends State<SelectorSortWidget>
    with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (controller) {
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
                  text: 'Sort By',
                  weight: FontWeight.w500,
                  size: 18,
                  color: theme.black90,
                ),
              ),
              ListRadioWidget(
                label: 'Highest Rating',
                groupValue: controller.sort,
                value: 'recommedation',
                onChanged: (value) {
                  controller.sort = 'recommedation';
                  controller.update();
                },
              ),
              ListRadioWidget(
                label: 'Lowest Price',
                groupValue: controller.sort,
                value: 'lower_price',
                onChanged: (value) {
                  controller.sort = 'lower_price';
                  controller.update();
                },
              ),
              ListRadioWidget(
                label: 'Highest Price',
                groupValue: controller.sort,
                value: 'highest_price',
                onChanged: (value) {
                  controller.sort = 'highest_price';
                  controller.update();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ButtonBasicWidget(
                  text: 'Search',
                  isFullWidht: true,
                  onTap: () {
                    controller.getLocations();
                    Get.back();
                  },
                ),
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
