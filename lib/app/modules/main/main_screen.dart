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
        child: Text("Main Body"),
      ),
    );
  }
}
