import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/core/utils/currency.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/data/model/locations/detail/response_detail_location_packages.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPackageWidget extends StatelessWidget with BaseWidgetMixin {
  final ResponseDetailLocationPackages? data;
  final String? currency;
  final LocationArguments? locationArguments;
  const ItemPackageWidget({
    Key? key,
    this.data,
    this.currency,
    this.locationArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 6),
              blurRadius: 7,
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.1),
            ),
          ]),
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                // child: Assets.images.loginBanner.image(width: 70),
                child: Image.network(
                  data?.image ?? 'https://dummyimage.com/200x100/000/fff',
                  width: 70,
                ),
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBasicWidget(
                      text: data?.packageName ?? '',
                      size: 14,
                      weight: FontWeight.w600,
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
                                text:
                                    '${data?.dayCount} Days ${data?.nightCount} Night',
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
                                text: '${data?.diveCount} Dives',
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
                              text: '${data?.minimumDiver} Divers',
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
              text: '${currency} ${data?.price.addComma()}',
              size: 16,
              weight: FontWeight.w700,
            ),
          ),
          ButtonBasicWidget(
            isFullWidht: true,
            text: 'Choose',
            onTap: () {
              Get.toNamed(
                Routes.BOOKING,
                arguments: BookingArguments(
                  package: data,
                  location: locationArguments,
                  currency: currency,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
