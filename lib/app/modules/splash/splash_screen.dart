import 'package:bookingdive/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_view.dart';
import '../../core/utils/size_config.dart';

class SplashScreen extends BaseView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig().screenWidth,
        height: SizeConfig().screenHeight,
        decoration: const BoxDecoration(color: Colors.blueAccent),
        child: Stack(
          children: [
            // Assets.images.backgroundSplash.svg(
            //   width: double.infinity,
            //   height: double.infinity,
            //   fit: BoxFit.cover,
            //   key: const ValueKey('splash_background_image'),
            // ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  SizedBox(
                    width: SizeConfig().screenWidth / 3,
                    // child: Assets.images.logoSplash.svg(
                    //   key: const ValueKey('splash_logo_image'),
                    //   fit: BoxFit.scaleDown,
                    // ),
                    child: Text("Logo"),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Welcome to Booking Dive',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                    key: ValueKey('splash_welcome_text'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
