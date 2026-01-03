// onboarding3_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/onboarding_layout.dart';
import '../widgets/circle_icon_button.dart';
import '../widgets/primary_button.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      imagePath: '../assets/onboarding3.jpg',
      title: "Reminder Notification",
      description: "Never miss your important tasks.",
      button: Row(
        children: [
          CircleIconButton(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.pop(context),
          ),

          const SizedBox(width: 16),
          Expanded(
            child: PrimaryButton(
              text: "Get Started",
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
