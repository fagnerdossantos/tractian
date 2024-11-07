import 'package:flutter/widgets.dart';

import '../../logic/interfaces/hierarchical_item.dart';
import 'custom_expandable_tile.dart';

class ExpandableTileBuilder extends StatelessWidget {
  final List<HierarchicalItem> hierarchy;

  const ExpandableTileBuilder({super.key, required this.hierarchy});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hierarchy.length,
      itemBuilder: (_, i) {
        return CustomExpandableTile(item: hierarchy[i]);
      },
    );
  }
}
