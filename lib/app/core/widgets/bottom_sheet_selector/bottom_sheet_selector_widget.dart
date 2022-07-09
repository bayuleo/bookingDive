import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/bottom_sheet_selector/bottom_sheet_selector_controller.dart';
import 'package:bookingdive/app/core/widgets/bottom_sheet_selector/selector_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class BottomSheetSelectorWidget extends StatefulWidget {
  final BottomSheetSelectorController selectorController;
  final String hint;
  final String selectorHint;
  final String selectorTitle;
  final bool isEnable;

  const BottomSheetSelectorWidget({
    Key? key,
    required this.selectorController,
    this.hint = '',
    this.selectorHint = '',
    this.selectorTitle = '',
    this.isEnable = true,
  }) : super(key: key);

  @override
  State<BottomSheetSelectorWidget> createState() =>
      _BottomSheetSelectorWidgetState();
}

class _BottomSheetSelectorWidgetState extends State<BottomSheetSelectorWidget>
    with BaseStateMixin {
  final textEditingController = TextEditingController();

  void showSelector() {
    if (widget.isEnable) {
      widget.selectorController.showBottomSheet();
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: theme.white,
        builder: (_) {
          return SelectorWidget(
            controller: widget.selectorController,
            title: widget.selectorTitle,
            hint: widget.selectorHint,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormFieldOutlineWidget(
      controller: textEditingController,
      hint: widget.hint,
      readOnly: true,
      rightIcon: Assets.icons.downStrokeIcon
          .svg(width: 8, height: 8, fit: BoxFit.scaleDown),
      onTapRightIcon: showSelector,
      onTap: showSelector,
    );
  }
}
