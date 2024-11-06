import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/widgets.dart' show runApp;
import 'package:tractian/app_widget.dart';

// !  Test Main using Preview
void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (_) => const AppWidget(),
      ),
    );

// Real Main
// void main() => runApp(const AppWidget());
