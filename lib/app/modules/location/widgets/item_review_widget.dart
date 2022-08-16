import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ItemReviewWidget extends StatelessWidget with BaseWidgetMixin {
  final ResponseReviewData data;
  ItemReviewWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 237,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: theme.black10),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.network(
                      width: 8,
                      height: 8,
                      data.avatar,
                      errorBuilder: (context, error, stackTrace) {
                        return Assets.images.personBlue
                            .image(width: 24, height: 24);
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextBasicWidget(
                        text: data.name,
                        size: 14,
                        weight: FontWeight.w400,
                        color: theme.black50,
                      ),
                      TextBasicWidget(
                        text: data.posted,
                        size: 12,
                        weight: FontWeight.w400,
                        color: theme.black30,
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                  ),
                  TextBasicWidget(
                    text: data.star,
                    size: 18,
                    weight: FontWeight.w700,
                    color: theme.black50,
                  )
                ],
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: theme.disable,
          ),
          TextBasicWidget(
            text: data.review,
            size: 12,
            maxLine: 3,
            weight: FontWeight.w400,
            color: theme.black50,
            textOverflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 0, top: 16, right: 0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.images.length,
              itemBuilder: (BuildContext context, int index) {
                var item = data.images[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  // child: Assets.images.loginBanner
                  //     .image(width: 48, height: 48, fit: BoxFit.cover),
                  child: Image.network(
                    item,
                    width: 8,
                    height: 8,
                    errorBuilder: (context, error, stackTrace) {
                      return Assets.images.loginBanner
                          .image(width: 48, height: 48);
                    },
                  ),
                );
              },
            ),
          ),
          // Row(
          //   children: [
          //     Assets.images.loginBanner
          //         .image(width: 48, height: 48, fit: BoxFit.cover),
          //     Assets.images.loginBanner
          //         .image(width: 48, height: 48, fit: BoxFit.cover),
          //     Assets.images.loginBanner
          //         .image(width: 48, height: 48, fit: BoxFit.cover),
          //     Assets.images.loginBanner
          //         .image(width: 48, height: 48, fit: BoxFit.cover),
          //     Assets.images.loginBanner
          //         .image(width: 48, height: 48, fit: BoxFit.cover),
          //   ],
          // )
        ],
      ),
    );
  }
}
