import 'package:flutter/material.dart';

class NeumorphicBox extends StatelessWidget {
  final String label;
  final Function() callBack;

  const NeumorphicBox({super.key, required this.label, required this.callBack});

  // Settings
  static const double width = 300;
  static const double height = 100;

  static const Color backgroundColor = Color(0xFFE0E0E0);
  static const Color primaryShadowColor = Color(0xFF9E9E9E);
  static const Color secondaryShadowColor = Color(0xFFFFFFFF);

  static const double blurRadius = 15;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Action
      onTap: callBack,
      child: Center(
        child: Container(
          // Sizing
          width: width,
          height: height,

          decoration: BoxDecoration(
            //
            color: backgroundColor,

            boxShadow: const [
              //
              BoxShadow(
                color: primaryShadowColor,
                offset: Offset(10, 10),
                blurRadius: blurRadius,
              ),

              BoxShadow(
                color: secondaryShadowColor,
                offset: Offset(-10, -10),
                blurRadius: blurRadius,
              ),
            ],

            borderRadius: BorderRadius.circular(20),
          ),

          // Used to align the child content
          alignment: Alignment.center,

          child: Text(
            label,

            //
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
