import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_view.dart';
import 'main_controller.dart';

class MainScreen extends BaseView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Main Body"),
            Text("Email : ${controller.email}"),
            Text("Token : ${controller.token}"),
            Text("Refresh Token : ${controller.refreshToken}"),
            ButtonBasicWidget(
              text: 'Logout',
              onTap: controller.handleButtonLogout,
            )
          ],
        ),
      ),
    );
  }
}
