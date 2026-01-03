import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          side: const BorderSide(color: Colors.blue, width: 2),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.blue, size: 22),
      ),
    );
  }
}
