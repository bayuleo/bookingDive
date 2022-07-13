import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/widgets/text/text_basic_widget.dart';

class ItemLocationHomeWidget extends StatelessWidget with BaseWidgetMixin {
  const ItemLocationHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36),
      child: Column(
        children: [
          SizedBox(
            height: 155,
            width: double.infinity,
            child: Image.asset(
              'assets/images/login_banner.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: TextBasicWidget(
                        text: 'SEMPORNA',
                        weight: FontWeight.w700,
                        color: theme.black50,
                        size: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Assets.icons.locationIcon.svg(),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: TextBasicWidget(
                            text: 'Malaysia, 18 Dive Centers',
                            weight: FontWeight.w400,
                            color: theme.black50,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ButtonOutlineBasicWidget(
                    text: 'See all', size: Size(100, 42), onTap: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }
}
