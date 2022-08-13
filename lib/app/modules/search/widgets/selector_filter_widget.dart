import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/search/search_controller.dart';
import 'package:bookingdive/mock/search_filter_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/button/button_basic_widget.dart';

class SelectorFilterWidget extends StatefulWidget {
  const SelectorFilterWidget({Key? key}) : super(key: key);

  @override
  State<SelectorFilterWidget> createState() => _SelectorFilterWidgetState();
}

class _SelectorFilterWidgetState extends State<SelectorFilterWidget>
    with BaseStateMixin {
  final fakeData = SearchFilterMockData().successResponse;
  var dummyValRadio = '1';
  var dummyValCheckbox = '1';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (controller) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 42),
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
            padding: EdgeInsets.only(left: 24, right: 24, top: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBasicWidget(
                      text: 'Filter',
                      weight: FontWeight.w500,
                      size: 18,
                      color: theme.black90,
                    ),
                    InkWell(
                      onTap: () {
                        controller.listFilterSelectedInclusion = [];
                        controller.listFilterSelectedExclusion = [];
                        controller.update();
                      },
                      child: TextBasicWidget(
                        text: 'Reset',
                        size: 18,
                        weight: FontWeight.w500,
                        color: theme.main50,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 8),
                  child: TextBasicWidget(
                    text: 'Inclusion',
                    size: 16,
                    weight: FontWeight.w700,
                    color: theme.black90,
                  ),
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Certification',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value: controller.listFilterSelectedInclusion
                      .contains('certification'),
                  onChanged: (value) {
                    controller.onFilterInclusionChange(
                        'certification', value ?? false);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Equipment rental set',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value: controller.listFilterSelectedInclusion
                      .contains('rental-set'),
                  onChanged: (value) {
                    controller.onFilterInclusionChange(
                        'rental-set', value ?? false);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Nitrox per dive',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value:
                      controller.listFilterSelectedInclusion.contains('nitrox'),
                  onChanged: (value) {
                    controller.onFilterInclusionChange(
                        'nitrox', value ?? false);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Regulator',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value: controller.listFilterSelectedInclusion
                      .contains('regulator'),
                  onChanged: (value) {
                    controller.onFilterInclusionChange(
                        'regulator', value ?? false);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Training materials',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value: controller.listFilterSelectedInclusion
                      .contains('training'),
                  onChanged: (value) {
                    controller.onFilterInclusionChange(
                        'training', value ?? false);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Weights/Weight belt',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value:
                      controller.listFilterSelectedInclusion.contains('belt'),
                  onChanged: (value) {
                    controller.onFilterInclusionChange('belt', value ?? false);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 8),
                  child: TextBasicWidget(
                    text: 'Exclusion',
                    size: 16,
                    weight: FontWeight.w700,
                    color: theme.black90,
                  ),
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Dive computer',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value: controller.listFilterSelectedExclusion
                      .contains('computer'),
                  onChanged: (value) {
                    controller.onFilterExclusionChange(
                        'computer', value ?? false);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'Marine park fees',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value:
                      controller.listFilterSelectedExclusion.contains('marine'),
                  onChanged: (value) {
                    controller.onFilterExclusionChange(
                        'marine', value ?? false);
                  },
                ),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -2),
                  title: TextBasicWidget(
                    text: 'National park fees',
                    size: 14,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  value: controller.listFilterSelectedExclusion
                      .contains('national'),
                  onChanged: (value) {
                    controller.onFilterExclusionChange(
                        'national', value ?? false);
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
        ),
      );
    });
  }
}
