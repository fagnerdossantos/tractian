import 'package:flutter/material.dart';

import '../../logic/interfaces/hierarchical_item.dart';

import 'tree_sub_item.dart';
import 'tree_title_component.dart';

class CustomExpandableTile extends StatelessWidget {
  final HierarchicalItem item;

  const CustomExpandableTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      //!
      title: TreeTitleComponent(item: item),
      leading: const Icon(Icons.arrow_drop_down_sharp),

      tilePadding: const EdgeInsets.all(8),
      showTrailingIcon: false,

      children: item.getSubItems().map((subItem) {
        return TreeSubItem(subItem: subItem);
      }).toList(),
    );
  }
}
