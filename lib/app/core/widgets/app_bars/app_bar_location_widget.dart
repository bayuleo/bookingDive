import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/search/widgets/selector_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../values/app_theme.dart';
import '../button/button_basic_widget.dart';

class AppBarLocationWidget extends StatelessWidget
    with PreferredSizeWidget, BaseWidgetMixin {
  final String? title1;
  final String? title2;
  final Function? onTapLeftIcon;
  final bool showBackButton;

  AppBarLocationWidget({
    Key? key,
    this.title1,
    this.title2,
    this.onTapLeftIcon,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.of(context).main70,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 24, top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBasicWidget(
                  text: title1!,
                  size: 16,
                  weight: FontWeight.w700,
                  color: Colors.white,
                ),
                TextBasicWidget(
                  text: title2!,
                  size: 12,
                  weight: FontWeight.w400,
                  color: Colors.white,
                ),
              ],
            ),
            ButtonBasicWidget(
              text: 'Change',
              onTap: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) {
                  return SelectorSearchWidget();
                },
              ),
              backgroundColor: theme.main10,
              textColor: theme.main50,
            ),
          ],
        ),
      ),
      titleSpacing: showBackButton ? 0 : 24,
      shadowColor: Colors.transparent,
      leading: showBackButton
          ? Transform.scale(
              scale: 0.3,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  onTapLeftIcon ?? Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Assets.icons.leftStrokeIcon.svg(height: 16, width: 4),
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
