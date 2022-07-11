import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/mock/spot_mock_data.dart';
import 'package:flutter/material.dart';

import '../text/text_basic_widget.dart';

class SelectorDateWidget extends StatefulWidget {
  // final BottomSheetSelectorController controller;
  // final String title;
  // final String hint;
  // final bool? isSelectorColor;

  const SelectorDateWidget({
    Key? key,
    // required this.controller,
    // required this.title,
    // required this.hint,
    // this.isSelectorColor,
  }) : super(key: key);

  @override
  State<SelectorDateWidget> createState() => _SelectorDateWidgetState();
}

class _SelectorDateWidgetState extends State<SelectorDateWidget>
    with BaseStateMixin {
  late VoidCallback _listener;

  final fakeData = SpotMockData().successResponse;

  _SelectorDestinationWidgetState() {
    _listener = () {
      setState(() {});
    };
  }

  @override
  void didUpdateWidget(covariant SelectorDateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // oldWidget.controller.removeListener(_listener);
    // widget.controller.addListener(_listener);
  }

  @override
  void initState() {
    // widget.controller.addListener(_listener);
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    // widget.controller.removeListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 9,
              color: Colors.black.withOpacity(0.2),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 32, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextBasicWidget(
                text: 'Check in date',
                size: 18,
                weight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Divider(),
            ),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now(),
              onDateChanged: (DateTime value) {},
            ),
          ],
        ),
      ),
    );
  }
}
