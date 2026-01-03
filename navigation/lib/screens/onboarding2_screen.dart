// onboarding2_screen.dart
import 'package:flutter/material.dart';
import '../widgets/onboarding_layout.dart';
import '../widgets/circle_icon_button.dart';
import '../widgets/primary_button.dart';
import 'onboarding3_screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingLayout(
      imagePath: '../assets/onboarding2.jpg',
      title: "Increase Work Effectiveness",
      description: "Track progress and improve productivity.",
      button: Column(
        children: [
          Row(
            children: [
              CircleIconButton(
                icon: Icons.arrow_back,
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  text: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const Onboarding3Screen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
