import 'package:flutter/widgets.dart';

import '../../logic/interfaces/hierarchical_item.dart';
import 'custom_expandable_tile.dart';

class TreeSubItem extends StatelessWidget {
  final HierarchicalItem subItem;
  const TreeSubItem({super.key, required this.subItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: CustomExpandableTile(item: subItem),
    );
  }
}
