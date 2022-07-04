import 'package:flutter/material.dart';

import '../../values/app_theme.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool isFill;
  final bool isCollapse;
  final TextStyle? textStyle;
  final int maxLines;
  final BoxDecoration? containerStyle;
  final EdgeInsets? pd;
  final EdgeInsets? mg;
  final Function onTap;
  final bool enabled;
  final bool isLoading;

  const ButtonWidget({
    Key? key,
    this.text = '',
    this.isFill = true,
    this.isCollapse = false,
    this.textStyle,
    this.maxLines = 1,
    this.containerStyle,
    this.pd,
    this.mg,
    this.enabled = true,
    this.isLoading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isCollapse) {
      return Expanded(child: button(context));
    }
    return button(context);
  }

  Widget button(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: mg ?? EdgeInsets.zero,
      decoration: enabled
          ? containerStyle ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: isFill
                    ? null
                    : Border.all(
                        width: 1,
                        color: AppTheme.of(context).main50,
                      ),
              )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppTheme.of(context).main50,
            ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: isFill
            ? (enabled
                ? AppTheme.of(context).main50
                : AppTheme.of(context).main10)
            : AppTheme.of(context).white,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          highlightColor: Colors.transparent,
          onTap: (enabled && !isLoading) ? () => onTap() : null,
          child: Container(
            padding:
                pd ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: isLoading
                ? const Center(
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Text(
                    text,
                    maxLines: maxLines,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        TextStyle(
                          color: isFill
                              ? (enabled
                                  ? AppTheme.of(context).white
                                  : AppTheme.of(context).black10)
                              : (enabled
                                  ? AppTheme.of(context).white
                                  : AppTheme.of(context).black10),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
