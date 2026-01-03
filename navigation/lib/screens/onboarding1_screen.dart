// onboarding1_screen.dart
import 'package:flutter/material.dart';
import '../widgets/onboarding_layout.dart';
import '../widgets/primary_button.dart';
import 'onboarding2_screen.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      imagePath: '../assets/onboarding1.jpg',
      title: "Easy Time Management",
      description: "Manage tasks easily and effectively.",
      button: PrimaryButton(
        text: "Next",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Onboarding2Screen()),
          );
        },
      ),
    );
  }
}
