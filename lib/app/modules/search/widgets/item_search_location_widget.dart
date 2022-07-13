import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/text/text_basic_widget.dart';

class ItemSearchLocationWidget extends StatelessWidget with BaseWidgetMixin {
  const ItemSearchLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: theme.white),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 24, top: 16, right: 24),
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return TextBasicWidget(
                  text: 'test',
                );
              }),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBasicWidget(
                  text: 'Equipment rental set',
                  color: theme.black30,
                ),
                TextBasicWidget(text: '•', color: theme.black30),
                TextBasicWidget(text: 'Regulator', color: theme.black30),
                TextBasicWidget(text: '•', color: theme.black30),
                TextBasicWidget(text: 'Certification', color: theme.black30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: TextBasicWidget(
                    text: 'Scuba Diving Courses and Fun Dives',
                    size: 18,
                    weight: FontWeight.w500,
                    color: theme.black50,
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
            child: TextBasicWidget(
              text: 'Semporna, Malaysia',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonOutlineBasicWidget(
                    text: 'Request to Book',
                    textColor: theme.black50,
                    borderColor: theme.black10,
                    icon: Assets.icons.clockIcon.svg(),
                    onTap: () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.icons.heartIcon.svg(color: theme.black30),
                Row(
                  children: [
                    TextBasicWidget(
                      text: 'Starts from',
                    ),
                    TextBasicWidget(
                      text: 'IDR 500,000',
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
