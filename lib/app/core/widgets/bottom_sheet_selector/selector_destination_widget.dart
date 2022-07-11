import 'package:bookingdive/app/core/base/base_state_mixin.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/mock/spot_mock_data.dart';
import 'package:flutter/material.dart';

class SelectorDestinationWidget extends StatefulWidget {
  // final BottomSheetSelectorController controller;
  // final String title;
  // final String hint;
  // final bool? isSelectorColor;

  const SelectorDestinationWidget({
    Key? key,
    // required this.controller,
    // required this.title,
    // required this.hint,
    // this.isSelectorColor,
  }) : super(key: key);

  @override
  State<SelectorDestinationWidget> createState() =>
      _SelectorDestinationWidgetState();
}

class _SelectorDestinationWidgetState extends State<SelectorDestinationWidget>
    with BaseStateMixin {
  late VoidCallback _listener;

  final fakeData = SpotMockData().successResponse;

  _SelectorDestinationWidgetState() {
    _listener = () {
      setState(() {});
    };
  }

  @override
  void didUpdateWidget(covariant SelectorDestinationWidget oldWidget) {
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
              padding: const EdgeInsets.only(right: 24, left: 24),
              child: TextBasicWidget(
                text: 'Choose your destination',
                size: 18,
                weight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, right: 24, left: 24),
              child: TextFormFieldOutlineWidget(
                hint: 'Search',
                leftIcon: Icon(Icons.search),
              ),
            ),
            Divider(),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 0, top: 16, right: 0),
                  shrinkWrap: true,
                  itemCount: fakeData.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final itemCountry = fakeData.data[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextBasicWidget(
                            text:
                                '${itemCountry.country.toUpperCase()}(${itemCountry.cities.length})',
                            size: 16,
                            weight: FontWeight.w700,
                            color: theme.main70,
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: itemCountry.cities.length,
                            itemBuilder: (BuildContext context, int index) {
                              final itemCities = itemCountry.cities[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: GestureDetector(
                                      onTap: () {}, // TODO handle on click city
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Icon(Icons.flag_outlined),
                                          ),
                                          TextBasicWidget(
                                            text: itemCities.city,
                                            size: 14,
                                            weight: FontWeight.w400,
                                            color: theme.black50,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                        if (itemCountry.cities.length > 0) Divider(),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
