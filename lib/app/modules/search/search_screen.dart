import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/search/search_controller.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_view.dart';

class SearchScreen extends BaseView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: theme.main70),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 72, bottom: 26, left: 26, right: 24),
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
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ButtonBasicWidget(
                        text: 'Filter', isFullWidht: false, onTap: () {}),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ButtonBasicWidget(
                        text: 'Sort', isFullWidht: false, onTap: () {}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
