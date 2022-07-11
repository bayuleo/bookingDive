import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:bookingdive/mock/spot_mock_data.dart';
import 'package:flutter/material.dart';

import '../text/text_basic_widget.dart';
import '../text/text_field_outline_widget.dart';

class SelectorNumberDiverWidget extends StatefulWidget {
  // final BottomSheetSelectorController controller;
  // final String title;
  // final String hint;
  // final bool? isSelectorColor;

  const SelectorNumberDiverWidget({
    Key? key,
    // required this.controller,
    // required this.title,
    // required this.hint,
    // this.isSelectorColor,
  }) : super(key: key);

  @override
  State<SelectorNumberDiverWidget> createState() =>
      _SelectorNumberDiverWidgetState();
}

class _SelectorNumberDiverWidgetState extends State<SelectorNumberDiverWidget>
    with BaseStateMixin {
  late VoidCallback _listener;

  final fakeData = SpotMockData().successResponse;

  _SelectorNumberDiverWidgetState() {
    _listener = () {
      setState(() {});
    };
  }

  @override
  void didUpdateWidget(covariant SelectorNumberDiverWidget oldWidget) {
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
        padding: EdgeInsets.only(top: 32, bottom: 52),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: TextBasicWidget(
                text: 'Number of diver',
                size: 18,
                weight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Assets.icons.buttonDownIcon.svg()),
                  Expanded(flex: 3, child: TextFormFieldOutlineWidget()),
                  Expanded(
                      flex: 1, child: Assets.icons.buttonUpActiveIcon.svg()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ButtonBasicWidget(
                text: 'Submit',
                isFullWidht: true,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
