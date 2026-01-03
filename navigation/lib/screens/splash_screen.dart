// splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding1_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Onboarding1Screen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgiQ1vqjE3LhAqvhmlNjPJ-1FrsqeKowwiJQ&s'),
            const SizedBox(height: 24),
            const Text(
              "UTH SmartTasks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}

