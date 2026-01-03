import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: const Color(0xFFF7F8FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE3E6EA)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE3E6EA)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}
