import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/location/review/widgets/item_detail_review_widget.dart';
import 'package:bookingdive/app/modules/location/review/widgets/selector_filter_review_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'review_controller.dart';

class ReviewScreen extends BaseView<ReviewController> {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: theme.main70),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, bottom: 20, left: 26, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child:
                          Assets.icons.leftStrokeIcon.svg(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TextBasicWidget(
                            text: 'Review',
                            weight: FontWeight.w700,
                            size: 16,
                            color: Colors.white,
                          ),
                          TextBasicWidget(
                            text: 'Scuba Diving Courses and Fun Dives ',
                            weight: FontWeight.w400,
                            size: 12,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: InkWell(
            onTap: () => showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) {
                return SelectorFilterReviewWidget();
              },
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Assets.icons.filterIcon.svg(),
                  ),
                  TextBasicWidget(
                    text: 'Filter',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Assets.icons.checkboxBlueIcon.svg(),
                  ),
                ],
              ),
            ),
          ),
        ),
        controller.isEmpty
            ? Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.emptyList.image(
                            width: MediaQuery.of(context).size.width * 0.4),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 8),
                          child: TextBasicWidget(
                            text: 'No Result Found',
                            weight: FontWeight.w700,
                            size: 18,
                            color: theme.black50,
                          ),
                        ),
                        TextBasicWidget(
                          text:
                              'Try changing the keywords or filters for better results ',
                          size: 16,
                          color: theme.black30,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBasicWidget(
                            text: 'Review',
                            size: 14,
                            weight: FontWeight.w600,
                            color: theme.black70,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: TextBasicWidget(
                                    text: '5',
                                    size: 16,
                                    weight: FontWeight.w700,
                                    color: theme.black50,
                                  ),
                                ),
                                TextBasicWidget(
                                  text: 'dari 12 review',
                                  size: 12,
                                  weight: FontWeight.w400,
                                  color: theme.black30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 4,
                      color: theme.disable,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 0, top: 8, right: 0),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(children: [
                            ItemReviewDetailWidget(),
                            if (index - 2 != 0)
                              Divider(
                                thickness: 4,
                                color: theme.disable,
                              ),
                          ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ],
    ));
  }
}
