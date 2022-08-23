import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/location/loaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'item_package_widget.dart';

class SelectorPackagesWidget extends StatelessWidget with BaseWidgetMixin {
  const SelectorPackagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (controller) {
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
          padding: EdgeInsets.only(top: 32, bottom: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
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
                    itemCount: controller.data?.packages.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.data?.packages[index];
                      return ItemPackageWidget(
                        data: item,
                        currency: controller.data?.priceCurrency,
                        locationArguments: LocationArguments(
                            locationName: controller
                                    .searchDetailArguments?.locationName ??
                                '',
                            date: controller.searchDetailArguments?.date ?? '',
                            diver:
                                controller.searchDetailArguments?.diver ?? '',
                            id: controller.data?.productId ?? ''),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
