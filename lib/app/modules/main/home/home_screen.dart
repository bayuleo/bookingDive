import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/modules/main/home/widgets/item_location_home_widget.dart';
import 'package:bookingdive/app/modules/main/home/widgets/item_spot_home_widget.dart';
import 'package:bookingdive/app/modules/main/home/widgets/search_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/button/button_basic_widget.dart';
import '../../../core/widgets/text/text_basic_widget.dart';
import 'home_controller.dart';

class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Assets.images.bannerHome.image(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 32, top: 40, bottom: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.white),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextBasicWidget(
                          text: 'USD | ENG',
                          color: theme.white,
                          weight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                TextBasicWidget(
                  text: 'Explore Underwater',
                  size: 28,
                  weight: FontWeight.w700,
                  color: theme.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 20),
                  child: TextBasicWidget(
                    text:
                        'Browse and book your next dive from all\naround the world.',
                    textAlign: TextAlign.center,
                    weight: FontWeight.w400,
                    color: theme.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: SearchSectionWidget(
                    onTapDestination: controller.onTapDestination,
                    bottomSheetSelectorController:
                        controller.destinationBottomSelector,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Row(
                    children: [
                      TextBasicWidget(
                        text: 'Nearest',
                        color: theme.main50,
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      TextBasicWidget(
                        text: ' Diving Center',
                        color: theme.black50,
                        size: 18,
                        weight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 24, top: 16, right: 12),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemSpotHomeWidget();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28, top: 48),
                  child: Row(
                    children: [
                      TextBasicWidget(
                        text: 'Popular',
                        color: theme.main50,
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      TextBasicWidget(
                        text: ' Diving Center',
                        color: theme.black50,
                        size: 18,
                        weight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 24, top: 16, right: 12),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemSpotHomeWidget();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28, top: 48),
                  child: Row(
                    children: [
                      TextBasicWidget(
                        text: 'Popular',
                        color: theme.main50,
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      TextBasicWidget(
                        text: ' Diving Center',
                        color: theme.black50,
                        size: 18,
                        weight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 24, top: 16, right: 24),
                      shrinkWrap: true,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemLocationHomeWidget();
                      }),
                ),
                Stack(
                  children: [
                    Assets.images.loginBanner.image(),
                    Container(
                      margin: EdgeInsets.only(top: 180, left: 24, right: 24),
                      padding: EdgeInsets.all(24),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: theme.white,
                          border: Border.all(color: theme.white),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 9,
                              color: Colors.black.withOpacity(0.2),
                            )
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TextBasicWidget(
                              text: 'Own a Diving Center?',
                              size: 24,
                              color: theme.black50,
                              weight: FontWeight.w700,
                            ),
                          ),
                          TextBasicWidget(
                            text:
                                'If you have a Diving Centre or Dive Shop and want to reach out to Scuba Enthusiast around the world, bookingdive.com is the go-to-place to list your services',
                            textAlign: TextAlign.center,
                            weight: FontWeight.w400,
                            color: theme.black50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32, bottom: 16),
                            child: ButtonBasicWidget(
                                text: 'Add Listings',
                                isFullWidht: true,
                                onTap: () {}),
                          ),
                          ButtonOutlineBasicWidget(
                              text: 'Learn More',
                              isFullWidht: true,
                              onTap: () {})
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
