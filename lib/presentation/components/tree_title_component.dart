import 'package:flutter/material.dart';

import '../../logic/controllers/tree_controller.dart';
import '../../logic/interfaces/hierarchical_item.dart';

class TreeTitleComponent extends StatelessWidget {
  final HierarchicalItem item;

  const TreeTitleComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final controller = TreeController();

    return Row(
      children: [
        //
        Image(
          image: AssetImage(controller.itemToImage(item)),
          height: 20,
        ),

        const SizedBox(
          width: 10,
        ),

        Expanded(
          child: Text(
            item.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        // Optionals
        Row(
          children: [
            // Energy sensor
            Visibility(
              visible: controller.isEnergySensor(item),
              child: const Icon(
                Icons.energy_savings_leaf,
                size: 18,
                color: Colors.green,
              ),
            ),

            // Sensor status
            Visibility(
              visible: controller.isSensorCritical(item),
              child: Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
