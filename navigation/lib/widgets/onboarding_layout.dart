import 'package:flutter/material.dart';

class OnboardingLayout extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Widget button;

  const OnboardingLayout({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🖼️ ẢNH LOCAL (KHÔNG CORS)
            Image.asset(
              imagePath,
              height: 220,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 24),

            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              description,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            button,
          ],
        ),
      ),
    );
  }
}
