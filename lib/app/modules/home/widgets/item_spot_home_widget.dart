import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/text/text_basic_widget.dart';

class ItemSpotHomeWidget extends StatelessWidget with BaseWidgetMixin {
  const ItemSpotHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Assets.images.loginBanner.image(width: 280, height: 188),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextBasicWidget(
                text: 'Scuba Diving Courses and Fun Dives',
                weight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Assets.icons.locationIcon.svg(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextBasicWidget(
                    text: 'Sampoerna, Malaysia',
                    weight: FontWeight.w400,
                    color: theme.black30,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  TextBasicWidget(
                    text: 'Starts from ',
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                  TextBasicWidget(
                    text: 'IDR 500,000',
                    weight: FontWeight.w700,
                    color: theme.black50,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 2),
                  child: TextBasicWidget(
                    text: '5',
                    weight: FontWeight.w700,
                  ),
                ),
                TextBasicWidget(text: '(12)'),
              ],
            )
          ],
        ),
        SizedBox(
          width: 280,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Assets.icons.heartIcon.svg(color: Colors.white),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
