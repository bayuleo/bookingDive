import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/list/list_check_box_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/mock/search_filter_mock_data.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/button/button_basic_widget.dart';
import '../../../core/widgets/list/list_radio_widget.dart';

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
                  TextBasicWidget(
                    text: 'Reset',
                    size: 18,
                    weight: FontWeight.w500,
                    color: theme.main50,
                  )
                ],
              ),
              ListView.builder(
                  padding: EdgeInsets.only(left: 0, top: 0, right: 0),
                  shrinkWrap: true,
                  itemCount: fakeData.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final itemGrpup = fakeData.data[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 8),
                          child: TextBasicWidget(
                            text:
                                '${itemGrpup.group}(${itemGrpup.filterBy.length})',
                            size: 16,
                            weight: FontWeight.w700,
                            color: theme.black90,
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: itemGrpup.filterBy.length,
                            itemBuilder: (BuildContext context, int index) {
                              final itemFilterBy = itemGrpup.filterBy[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: itemGrpup.type == "Single"
                                          ? ListRadioWidget(
                                              groupValue: dummyValRadio,
                                              value: itemFilterBy.key,
                                              label: itemFilterBy.label,
                                            )
                                          : ListCheckBox(
                                              label: itemFilterBy.label,
                                            ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ],
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ButtonBasicWidget(
                  text: 'Search',
                  isFullWidht: true,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
