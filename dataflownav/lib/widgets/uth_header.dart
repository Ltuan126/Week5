import 'package:flutter/material.dart';

class UthHeader extends StatelessWidget {
  const UthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/uth_logo.png',
          height: 72,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 12),
        const Text(
          "SmartTasks",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
