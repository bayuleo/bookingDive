import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

class TextFormFieldOutlineWidget extends StatelessWidget with BaseWidgetMixin {
  final String? hint;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final Function? onTapRightIcon;
  final Function? validator;
  final Function? onChangedText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final bool obsecure;
  final bool readOnly;
  const TextFormFieldOutlineWidget(
      {Key? key,
      this.hint,
      this.obsecure = false,
      this.readOnly = false,
      this.controller,
      this.rightIcon,
      this.leftIcon,
      this.onChangedText,
      this.onTapRightIcon,
      this.onTap,
      this.autovalidateMode,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      obscureText: obsecure,
      autovalidateMode: autovalidateMode,
      validator: (value) => validator?.call(value),
      onChanged: (value) => onChangedText?.call(value),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: theme.black30),
        prefixIcon: leftIcon,
        suffixIcon: _rightIcon(),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.black10),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.main50),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.black10),
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
