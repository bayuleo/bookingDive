import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../values/app_theme.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Function? onTapLeftIcon;

  AppBarWidget({
    Key? key,
    this.title,
    this.onTapLeftIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.of(context).main70,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: title != null
          ? TextBasicWidget(
              text: title!,
              size: 16,
              weight: FontWeight.w700,
              color: Colors.white,
            )
          : null,
      titleSpacing: 0,
      shadowColor: Colors.transparent,
      leading: Transform.scale(
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
