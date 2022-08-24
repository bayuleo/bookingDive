import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/currency.dart';
import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/text/text_basic_widget.dart';

class ItemSearchLocationWidget extends StatelessWidget with BaseWidgetMixin {
  final ResponseDataListLocations? data;
  final Function onTapFavorite;

  const ItemSearchLocationWidget({
    Key? key,
    this.data,
    required this.onTapFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: theme.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.network(
                      data?.image ?? '',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width - 50,
                      errorBuilder: (context, exception, stackTrace) {
                        return Assets.images.loginBanner.image(
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width - 40);
                      },
                    ),
                  );
                }),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data?.inclusion.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = data?.inclusion[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: TextBasicWidget(
                        text:
                            '${item?.name}${index < ((data?.inclusion.length ?? 0) - 1) ? '     • ' : ''}',
                        color: theme.black30),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextBasicWidget(
                      text: data?.productName ?? '',
                      size: 18,
                      weight: FontWeight.w500,
                      color: theme.black50,
                    ),
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
                        text: data?.ratingResult.toString() ?? '-',
                        weight: FontWeight.w700,
                      ),
                    ),
                    TextBasicWidget(
                        text: '(${data?.ratingCount.toString() ?? '-'})'),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 36),
            child: TextBasicWidget(
              text: '${data?.locationState}, ${data?.locationCountry}',
              color: theme.black30,
              size: 12,
              weight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => onTapFavorite(),
                  child: (data?.isWishlist ?? false)
                      ? Assets.icons.heartRedIcon.svg(color: theme.error50)
                      : Assets.icons.heartIcon.svg(color: theme.black30),
                ),
                Row(
                  children: [
                    TextBasicWidget(
                      text: 'Starts from ',
                      color: theme.black30,
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    TextBasicWidget(
                      text:
                          '${data?.priceCurrency} ${data?.priceLower.addComma()}',
                      color: theme.main50,
                      weight: FontWeight.w700,
                      size: 16,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
