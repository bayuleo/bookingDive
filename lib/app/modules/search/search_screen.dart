import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/search/search_controller.dart';
import 'package:bookingdive/app/modules/search/widgets/button_filter_search_widget.dart';
import 'package:bookingdive/app/modules/search/widgets/item_search_location_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_view.dart';

class SearchScreen extends BaseView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgrounGrey,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: theme.main70),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 72, bottom: 20, left: 26, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Assets.icons.downStrokeIcon.svg(color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBasicWidget(
                              text: 'Solomon Islands',
                              weight: FontWeight.w700,
                              size: 16,
                              color: Colors.white,
                            ),
                            TextBasicWidget(
                              text: '8 September 2021 • 2 divers',
                              weight: FontWeight.w400,
                              size: 12,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ButtonBasicWidget(
                    text: 'Change',
                    onTap: () {},
                    backgroundColor: theme.main10,
                    textColor: theme.main50,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: theme.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 9,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: ButtonFilterSearchWidget(
                        title: 'Sort',
                        onClick: () {},
                        icon: Assets.icons.settingIcon.svg(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: ButtonFilterSearchWidget(
                        title: 'Filter',
                        onClick: () {},
                        icon: Assets.icons.filterIcon.svg(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 24, top: 16, right: 24),
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return ItemSearchLocationWidget();
                }),
          ))
        ],
      ),
    );
  }
}
