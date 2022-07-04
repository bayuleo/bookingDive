import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/widgets/container/simple_body_widget.dart';

class AuthBodyWidget extends StatelessWidget {
  final Widget? child;
  const AuthBodyWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBodyWidget(
      child: SingleChildScrollView(
        child: Column(children: [
          Assets.images.loginBanner.image(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: child,
          )
        ]),
      ),
    );
  }
}
