import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/main/whislist/whislist_controller.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../search/widgets/item_search_location_widget.dart';

class WhistlistScreen extends BaseView<WhislistController> {
  const WhistlistScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Whishlist',
        showBackButton: false,
      ),
      body: controller.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.icons.emptyStateWishlist.svg(),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 8),
                    child: TextBasicWidget(
                      text: 'Your Wishlist is Empty',
                      weight: FontWeight.w700,
                      size: 18,
                      color: theme.black50,
                    ),
                  ),
                  TextBasicWidget(
                    text:
                        'Tap the heart icon on every listing, and it will automatically show on this page',
                    size: 16,
                    color: theme.black30,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 24, top: 16, right: 24),
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemSearchLocationWidget();
                  }),
            ),
    );
  }
}
