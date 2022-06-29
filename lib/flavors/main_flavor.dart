import 'package:flutter/material.dart';

import '../app/app.dart';
import '../di.dart';
import 'flavors.dart';

Future<void> buildFlavor(Flavor flavor) async {
  FlavorConfigs.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjection.init(flavor);

  runApp(const App());
}
