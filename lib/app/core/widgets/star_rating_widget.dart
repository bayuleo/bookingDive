import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget with BaseWidgetMixin {
  final int rating;

  const StarRatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < rating; i++)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.star,
              size: 14,
              color: Colors.amber,
            ),
          ),
        for (int i = 0; i < 5 - rating; i++)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.star,
              size: 14,
              color: theme.black10,
            ),
          ),
      ],
    );
  }
}
