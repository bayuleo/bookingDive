import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_selector_controller.dart';

class SelectorWidget extends StatefulWidget {
  final BottomSheetSelectorController controller;
  final String title;
  final String hint;
  final bool? isSelectorColor;

  const SelectorWidget({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    this.isSelectorColor,
  }) : super(key: key);

  @override
  State<SelectorWidget> createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> with BaseStateMixin {
  late VoidCallback _listener;

  _SelectorWidgetState() {
    _listener = () {
      setState(() {});
    };
  }

  @override
  void didUpdateWidget(covariant SelectorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.controller.removeListener(_listener);
    widget.controller.addListener(_listener);
  }

  @override
  void initState() {
    widget.controller.addListener(_listener);
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.controller.removeListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Selector test'),
    );
  }
}
