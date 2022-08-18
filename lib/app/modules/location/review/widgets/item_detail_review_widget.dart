import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/star_rating_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/data/model/review/response_review_data.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';

class ItemReviewDetailWidget extends StatelessWidget with BaseWidgetMixin {
  final ResponseReviewData data;
  const ItemReviewDetailWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(right: 8),
            child: Assets.icons.personGreyIcon.svg(),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBasicWidget(
                    text: data.name,
                    size: 14,
                    weight: FontWeight.w600,
                    color: theme.black70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: StarRatingWidget(
                      rating: int.parse(data.star),
                    ),
                  ),
                  TextBasicWidget(
                    text: '${data.posted} | ${data.package}',
                    size: 12,
                    weight: FontWeight.w400,
                    color: theme.black30,
                  ),
                  SizedBox(
                    height: 32,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: TextBasicWidget(
                              text: 'Accuracy 4.5 not set',
                              size: 12,
                              weight: FontWeight.w600,
                              color: theme.main50,
                            ));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextBasicWidget(
                      text: data.review,
                      size: 12,
                      weight: FontWeight.w400,
                      color: theme.black50,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 0, top: 0, right: 0),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            // child: Assets.images.loginBanner
                            //     .image(width: 80, fit: BoxFit.cover),
                            child: Image.network(
                              data.images[index],
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
