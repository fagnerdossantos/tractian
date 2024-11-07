import 'package:flutter/material.dart';

import '../../logic/interfaces/hierarchical_item.dart';
import '../components/expandable_tile_builder.dart';
import '../components/sensor_filter_builder.dart';

class AssetTreeView extends StatelessWidget {
  final List<HierarchicalItem> hierarchy;

  const AssetTreeView({super.key, required this.hierarchy});

  // Settings
  static const backgroundColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      //
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Assets"),
        centerTitle: true,
      ),

      backgroundColor: backgroundColor,

      body: Padding(
        //
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [
            // Search bar
            const SizedBox(
              height: 50,
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: "Search Assets or Location",
              ),
            ),

            const SizedBox(height: 10),

            const SensorsFilterBuilder(),

            const Divider(height: 20, thickness: 1),
            Expanded(
              child: ExpandableTileBuilder(hierarchy: hierarchy),
            ),
          ],
        ),
      ),
    );
  }
}
