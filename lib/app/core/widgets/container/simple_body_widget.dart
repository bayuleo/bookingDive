import 'package:flutter/material.dart';

import '../../values/app_theme.dart';

class SimpleBodyWidget extends StatelessWidget {
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  const SimpleBodyWidget({
    Key? key,
    required this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: AppTheme.of(context).white,
      child: Stack(
        children: [
          // Positioned(
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: Assets.images.backgroundSymbol.svg(
          //       fit: BoxFit.fitWidth,
          //     ),
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}
