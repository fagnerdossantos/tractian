import 'package:flutter/material.dart';

import 'sensor_button.dart';

class SensorsFilterBuilder extends StatefulWidget {
  const SensorsFilterBuilder({super.key});

  @override
  State<SensorsFilterBuilder> createState() => _SensorsFilterBuilderState();
}

class _SensorsFilterBuilderState extends State<SensorsFilterBuilder> {
  List<bool> isSelected = [false, false];

  void changeSelection(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SensorButton(
          isSelected: isSelected[0],
          callBack: () => changeSelection(0),
          icon: Icons.energy_savings_leaf_outlined,
          label: "Energy sensor",
        ),
        const SizedBox(width: 10),
        SensorButton(
          isSelected: isSelected[1],
          callBack: () => changeSelection(1),
          icon: Icons.help,
          label: "Critical",
        ),
      ],
    );
  }
}