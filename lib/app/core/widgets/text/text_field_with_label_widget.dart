import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../values/app_theme.dart';

class TextFieldWithLabelWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? rightIcon;
  final Color? hintColor;
  final Widget? leftWidget;
  final Function? onTapRightIcon;
  final VoidCallback? onTap;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final int minLines;
  final int? maxLines;
  final bool enabled;
  final bool obsecure;
  final bool readOnly;
  final Function? validator;
  final Function? onChangedText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Key? rightIconKey;
  final bool changeBorderColorOnFocus;
  final Color? backgroundColor;
  final List<TextInputFormatter>? inputFormatter;
  final AutovalidateMode? autovalidateMode;
  final Function? onFieldSubmitted;

  const TextFieldWithLabelWidget({
    Key? key,
    this.label,
    this.hint,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.rightIcon,
    this.leftWidget,
    this.onTapRightIcon,
    this.onTap,
    this.margin,
    this.contentPadding,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled = true,
    this.obsecure = false,
    this.readOnly = false,
    this.validator,
    this.onChangedText,
    this.textInputAction,
    this.hintColor,
    this.focusNode,
    this.rightIconKey,
    this.changeBorderColorOnFocus = true,
    this.backgroundColor,
    this.inputFormatter,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color defaultBorderColor = AppTheme.of(context).branding;
    return Container(
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: label != null && label!.isNotEmpty
                ? Text(
                    label ?? '',
                    style: const TextStyle(fontSize: 14),
                  )
                : null,
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: controller,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: keyboardType,
            obscureText: obsecure,
            focusNode: focusNode,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: maxLines,
            autovalidateMode: autovalidateMode,
            enabled: enabled,
            initialValue: initialValue,
            validator: (value) => validator?.call(value),
            onChanged: (value) => onChangedText?.call(value),
            onTap: onTap,
            textInputAction: textInputAction,
            onFieldSubmitted: (value) => onFieldSubmitted?.call(value),
            style: TextStyle(
              color: enabled ? AppTheme.of(context).textBlack : Colors.grey,
              fontSize: 14,
            ),
            inputFormatters: inputFormatter,
            // ? Need hidden counterText when setting maxLength
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: '',
              isDense: true,
              filled: true,
              fillColor: backgroundColor ?? AppTheme.of(context).background,
              contentPadding: contentPadding,
              hintText: hint ?? label,
              suffixIcon: _rightIcon(),
              prefixIcon: leftWidget,
              hintStyle: TextStyle(
                fontSize: 14,
                color: hintColor ?? AppTheme.of(context).branding,
                overflow: TextOverflow.ellipsis,
              ),
              errorMaxLines: 10,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: changeBorderColorOnFocus
                      ? defaultBorderColor.withAlpha(200)
                      : defaultBorderColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: defaultBorderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: changeBorderColorOnFocus
                        ? Colors.grey.shade500
                        : defaultBorderColor,
                    width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _rightIcon() {
    if (rightIcon != null) {
      return InkWell(
        key: rightIconKey,
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
