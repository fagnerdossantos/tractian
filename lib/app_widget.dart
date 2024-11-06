import 'package:device_preview_plus/device_preview_plus.dart'
    show DevicePreview;

import 'package:flutter/material.dart'
    show BuildContext, Colors, MaterialApp, StatelessWidget, ThemeData, Widget;
import 'package:tractian/logic/models/company.dart';
import 'package:tractian/presentation/views/asset_tree_view.dart';

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

      // home: HomeView(companies: companies),
      home: const AssetTreeView(locations: []),
    );
  }
}

final companies = cMap.map((e) => Company.fromMap(e)).toList();

final cMap = [
  {"id": "662fd0ee639069143a8fc387", "name": "Jaguar"},
  {"id": "662fd0fab3fd5656edb39af5", "name": "Tobias"},
  {"id": "662fd100f990557384756e58", "name": "Apex"}
];
