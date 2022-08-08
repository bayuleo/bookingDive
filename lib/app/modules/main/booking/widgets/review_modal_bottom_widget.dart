import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewModalBottomWidget extends StatelessWidget with BaseWidgetMixin {
  const ReviewModalBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: const BorderRadius.only(
            topRight: const Radius.circular(20),
            topLeft: const Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 9,
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 42),
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 28),
                child: const TextBasicWidget(
                  text: 'Write a Review',
                  size: 18,
                  weight: FontWeight.w500,
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating.ceil());
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 28),
                  child: TextBasicWidget(
                    text: 'Overall Rating*',
                    size: 16,
                    weight: FontWeight.w700,
                    color: theme.black50,
                  ),
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating.ceil());
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 28),
                  child: TextBasicWidget(
                    text: 'Accuracy',
                    size: 16,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating.ceil());
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 28),
                  child: TextBasicWidget(
                    text: 'Communication',
                    size: 16,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating.ceil());
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 28),
                  child: TextBasicWidget(
                    text: 'Cleanliness',
                    size: 16,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating.ceil());
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 28),
                  child: TextBasicWidget(
                    text: 'Location',
                    size: 16,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating.ceil());
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 28),
                  child: TextBasicWidget(
                    text: 'Check In',
                    size: 16,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                ),
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating.ceil());
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 28),
                  child: TextBasicWidget(
                    text: 'Value',
                    size: 16,
                    weight: FontWeight.w400,
                    color: theme.black50,
                  ),
                ),
              ),
              const TextFormFieldOutlineWidget(
                label: const Text('Feedback'),
                maxLines: 10,
                minLines: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 40),
                child: ButtonBasicWidget(
                  icon: Assets.icons.plusIcon.svg(),
                  text: 'Upload photo',
                  textColor: theme.main50,
                  isFullWidht: true,
                  backgroundColor: theme.main10,
                  onTap: () {},
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ButtonOutlineBasicWidget(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        text: 'Cancel',
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ButtonBasicWidget(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        text: 'Refund',
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
