import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ItemReviewWidget extends StatelessWidget with BaseWidgetMixin {
  const ItemReviewWidget({Key? key}) : super(key: key);

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Assets.icons.personBlueIcon.svg(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextBasicWidget(
                        text: 'Jane Doe',
                        size: 14,
                        weight: FontWeight.w400,
                        color: theme.black50,
                      ),
                      TextBasicWidget(
                        text: '22 Jan 2022 ',
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
                    text: '5',
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
            text:
                'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit...',
            size: 12,
            weight: FontWeight.w400,
            color: theme.black50,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 0, top: 16, right: 0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Assets.images.loginBanner
                      .image(width: 48, height: 48, fit: BoxFit.cover),
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
