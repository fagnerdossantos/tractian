import 'package:flutter/material.dart';

import '../../logic/interfaces/hierarchical_item.dart';
import '../components/sensor_filter_builder.dart';

class AssetTreeView extends StatelessWidget {
  final List<HierarchicalItem> locations;

  const AssetTreeView({super.key, required this.locations});

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

      body: const Padding(
        //
        padding: EdgeInsets.all(15),

        child: Column(
          children: [
            // Search bar
            SizedBox(
              height: 50,
              child: SearchBar(
                leading: Icon(Icons.search),
                hintText: "Search Assets or Location",
              ),
            ),

            SizedBox(height: 10),

            SensorsFilterBuilder(),

            Divider(height: 20, thickness: 1),
            // Expanded(
            //   child: ExpandableTileBuilder(locations: locations),
            // ),
          ],
        ),
      ),
    );
  }
}
