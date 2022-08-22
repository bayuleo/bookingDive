import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/currency.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';

class ItemSpotHomeWidget extends StatelessWidget with BaseWidgetMixin {
  final ResponseDataListLocation data;
  final Function onTapFavorite;

  const ItemSpotHomeWidget({
    Key? key,
    required this.data,
    required this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assets.images.loginBanner.image(width: 280, height: 188),
            Image.network(
              data.image,
              width: 280,
              height: 188,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextBasicWidget(
                text: data.productName,
                weight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Assets.icons.locationIcon.svg(),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextBasicWidget(
                    text: '${data.locationState}, ${data.locationCountry}',
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
                    text: '${data.priceCurrency} ${data.priceLower.addComma()}',
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
                    text: '${data.ratingResult}',
                    weight: FontWeight.w700,
                  ),
                ),
                TextBasicWidget(text: '(${data.ratingCount})'),
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
                child: InkWell(
                  onTap: () => onTapFavorite(),
                  child: data.isWishlist
                      ? Assets.icons.heartRedIcon.svg()
                      : Assets.icons.heartIcon.svg(color: Colors.white),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
