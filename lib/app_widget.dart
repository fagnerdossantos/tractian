import 'package:device_preview_plus/device_preview_plus.dart'
    show DevicePreview;

import 'package:flutter/material.dart'
    show BuildContext, Colors, MaterialApp, StatelessWidget, ThemeData, Widget;
import 'package:tractian/presentation/views/views_builder.dart';

// !  Test AppWidget using Preview
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
      ),

      home: const ViewsBuilder(),
    );
  }
}
