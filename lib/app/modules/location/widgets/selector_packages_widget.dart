import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SelectorPackagesWidget extends StatelessWidget with BaseWidgetMixin {
  const SelectorPackagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 9,
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: TextBasicWidget(
                text: 'Package',
                size: 18,
                weight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 0, top: 0, right: 0),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ItemPackageWidget(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemPackageWidget extends StatelessWidget with BaseWidgetMixin {
  const ItemPackageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: theme.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 25),
          blurRadius: 7,
          spreadRadius: -25,
          color: Colors.black.withOpacity(0.1),
        ),
      ]),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Assets.images.loginBanner.image(width: 70),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBasicWidget(
                      text: 'Refresher Dive',
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    TextBasicWidget(
                      text: 'Package Type: Refresher Course',
                      size: 12,
                      weight: FontWeight.w400,
                      color: theme.black30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 6),
                      child: Row(
                        children: [
                          Assets.icons.calendarIcon.svg(),
                          Row(
                            children: [
                              TextBasicWidget(
                                text: 'Days: ',
                                size: 12,
                                weight: FontWeight.w400,
                                color: theme.black50,
                              ),
                              TextBasicWidget(
                                text: '3 Days 1 Night',
                                size: 12,
                                weight: FontWeight.w700,
                                color: theme.black70,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Assets.icons.anchorIcon.svg(),
                          Row(
                            children: [
                              TextBasicWidget(
                                text: 'Number of Dive:: ',
                                size: 12,
                                weight: FontWeight.w400,
                                color: theme.black50,
                              ),
                              TextBasicWidget(
                                text: '4 Dives',
                                size: 12,
                                weight: FontWeight.w700,
                                color: theme.black70,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Assets.icons.peopleIcon.svg(),
                        Row(
                          children: [
                            TextBasicWidget(
                              text: 'Number of Diver:: ',
                              size: 12,
                              weight: FontWeight.w400,
                              color: theme.black50,
                            ),
                            TextBasicWidget(
                              text: '2 Divers',
                              size: 12,
                              weight: FontWeight.w700,
                              color: theme.black70,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: TextBasicWidget(
              text: 'IDR 500.000',
              size: 16,
              weight: FontWeight.w700,
            ),
          ),
          ButtonBasicWidget(
            isFullWidht: true,
            text: 'Choose',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
