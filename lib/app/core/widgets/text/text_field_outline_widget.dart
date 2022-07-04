import 'package:flutter/material.dart';

import '../../values/app_theme.dart';

class TextFormFieldOutlineWidget extends StatelessWidget {
  final String? hint;
  final Widget? rightIcon;
  final Function? onTapRightIcon;
  const TextFormFieldOutlineWidget({
    Key? key,
    this.hint,
    this.rightIcon,
    this.onTapRightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: _rightIcon(),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.of(context).black10),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.of(context).main50),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.of(context).black10),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget? _rightIcon() {
    if (rightIcon != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: rightIcon!,
        ),
        onTap: () => onTapRightIcon?.call(),
      );
    }
    return null;
  }
}
