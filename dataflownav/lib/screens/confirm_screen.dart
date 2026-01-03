import 'package:flutter/material.dart';
import '../widgets/uth_header.dart';
import '../widgets/primary_button.dart';
import '../widgets/circle_icon_button.dart';

class ConfirmScreen extends StatelessWidget {
  final String email;
  final String code;
  final String password;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.code,
    required this.password,
  });

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
                "Confirm",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                "We are here to help you!",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 18),

              // Hiển thị data flow để thầy thấy bạn truyền data
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE3E6EA)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email: $email"),
                    const SizedBox(height: 6),
                    Text("Code: $code"),
                    const SizedBox(height: 6),
                    Text("Password: ${'*' * (password.isEmpty ? 0 : password.length)}"),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              PrimaryButton(
                text: "Submit",
                onPressed: () {
                  // Kết thúc flow: quay về màn đầu
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
