import 'package:flutter/material.dart';
import '../widgets/uth_header.dart';
import '../widgets/primary_button.dart';
import '../widgets/circle_icon_button.dart';
import 'reset_password_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;
  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final List<TextEditingController> codeCtrls =
      List.generate(5, (_) => TextEditingController());

  @override
  void dispose() {
    for (final c in codeCtrls) {
      c.dispose();
    }
    super.dispose();
  }

  String get code => codeCtrls.map((e) => e.text).join();

  Widget _codeBox(TextEditingController c) {
    return SizedBox(
      width: 46,
      height: 46,
      child: TextField(
        controller: c,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: const Color(0xFFF7F8FA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE3E6EA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE3E6EA)),
          ),
        ),
      ),
    );
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
                "Verify Code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter the code we just sent to ${widget.email}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _codeBox(codeCtrls[0]),
                  const SizedBox(width: 10),
                  _codeBox(codeCtrls[1]),
                  const SizedBox(width: 10),
                  _codeBox(codeCtrls[2]),
                  const SizedBox(width: 10),
                  _codeBox(codeCtrls[3]),
                  const SizedBox(width: 10),
                  _codeBox(codeCtrls[4]),
                ],
              ),

              const SizedBox(height: 18),

              PrimaryButton(
                text: "Next",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResetPasswordScreen(
                        email: widget.email,
                        code: code,
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
