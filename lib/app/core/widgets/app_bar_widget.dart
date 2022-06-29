import 'package:flutter/material.dart';

import '../values/app_theme.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String? titleText;
  final TextStyle? titleStyle;
  final Icon? rightIcon;
  final Function? onTapRightIcon;
  final Icon? leftIcon;
  final Function? onTapLeftIcon;
  final Color? bgColor;
  final Color? leftIconColor;
  final Color leftIconHighlightColor;
  final Color leftIconSplashColor;
  final bool isCenterTitle;
  final Key? leftButtonKey;
  final double? elevation;
  final bool showLeftIcon;

  AppBarWidget({
    Key? key,
    this.titleText,
    this.titleStyle,
    this.rightIcon,
    this.onTapRightIcon,
    this.leftIcon,
    this.onTapLeftIcon,
    this.bgColor,
    this.leftIconColor,
    this.leftIconHighlightColor = Colors.grey,
    this.leftIconSplashColor = Colors.transparent,
    this.isCenterTitle = true,
    this.leftButtonKey,
    this.elevation = 1 / 2,
    this.showLeftIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? AppTheme.of(context).branding,
      elevation: elevation,
      automaticallyImplyLeading: false,
      centerTitle: isCenterTitle,
      title: titleText != null
          ? Text(
              titleText!,
              style: titleStyle ??
                  const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
            )
          : null,
      actions: rightIcon != null
          ? [
              IconButton(
                onPressed: () => onTapRightIcon?.call(),
                icon: rightIcon!,
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
