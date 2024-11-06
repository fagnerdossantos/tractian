import 'package:flutter/material.dart';

class SensorButton extends StatelessWidget {
  final bool isSelected;
  final Function() callBack;
  final IconData icon;
  final String label;

  const SensorButton({
    super.key,
    required this.isSelected,
    required this.callBack,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? OutlinedButton.icon(
            onPressed: callBack,
            icon: Icon(icon),
            label: Text(label),
          )
        : TextButton.icon(
            onPressed: callBack,
            icon: Icon(icon),
            label: Text(label),
          );
  }
}
