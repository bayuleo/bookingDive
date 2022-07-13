import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:flutter/material.dart';

class SelectorSortWidget extends StatefulWidget {
  const SelectorSortWidget({Key? key}) : super(key: key);

  @override
  State<SelectorSortWidget> createState() => _SelectorSortWidgetState();
}

class _SelectorSortWidgetState extends State<SelectorSortWidget>
    with BaseStateMixin {
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
        padding: EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextBasicWidget(
              text: 'Sort By',
              weight: FontWeight.w500,
              size: 18,
              color: theme.black90,
            ),
          ],
        ),
      ),
    );
  }
}
