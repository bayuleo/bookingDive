import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../values/app_theme.dart';
import '../values/app_theme_data.dart';

/// A mixin on State.
///
/// [BaseStateMixin] allows you to use i18n, theme and logger in a StatefulWidget faster and simpler.
///
/// {@tool snippet}
/// ```dart
/// class MyWidget extends StatefulWidget {
///   const MyWidget({Key? key}) : super(key: key);
///
///   @override
///   State<MyWidget> createState() => _MyWidgetState();
/// }
///
/// class _MyWidgetState extends State<MyWidget> with BaseStateMixin {
///   @override
///   Widget build(BuildContext context) {
///     return Center(
///       child: Text(
///         i18n.Hello,
///         style: TextStyle(color: theme.babyBlue),
///       ),
///     );
///   }
/// }
/// ```
/// {@end-tool}
mixin BaseStateMixin {
  AppThemeData get theme => AppTheme.of(Get.context!);
  Logger get logger => Get.find<Logger>();
}
