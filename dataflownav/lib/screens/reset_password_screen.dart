import 'package:flutter/material.dart';
import '../widgets/uth_header.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/circle_icon_button.dart';
import 'confirm_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String code;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  @override
  void dispose() {
    passCtrl.dispose();
    confirmCtrl.dispose();
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
              Align(
                alignment: Alignment.centerLeft,
                child: CircleIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 10),
              const UthHeader(),
              const SizedBox(height: 22),
              const Text(
                "Create new password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your new password must be different from previously used password",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 18),

              AppTextField(
                controller: passCtrl,
                hint: "Password",
                icon: Icons.lock_outline,
                obscure: true,
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: confirmCtrl,
                hint: "Confirm Password",
                icon: Icons.lock_outline,
                obscure: true,
              ),

              const SizedBox(height: 18),

              PrimaryButton(
                text: "Next",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConfirmScreen(
                        email: widget.email,
                        code: widget.code,
                        password: passCtrl.text,
                      ),
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
