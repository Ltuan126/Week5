import 'package:flutter/material.dart';
import '../widgets/uth_header.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';
import 'verify_code_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 28),
              const UthHeader(),
              const SizedBox(height: 22),
              const Text(
                "Forget Password?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                "Enter your Email, we will send you a verification code.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 18),

              AppTextField(
                controller: emailController,
                hint: "Your Email",
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 18),

              PrimaryButton(
                text: "Next",
                onPressed: () {
                  final email = emailController.text.trim();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VerifyCodeScreen(email: email),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
