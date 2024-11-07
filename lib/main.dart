import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/widgets.dart' show runApp;
import 'package:tractian/app_widget.dart';
import 'package:tractian/logic/providers/app_instancies.dart';

// !  Test Main using Preview
void main() {
  // Initializing getIt instancies
  AppInstancies().register();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => const AppWidget(),
    ),
  );
}

// Real Main
// void main() => runApp(const AppWidget());
