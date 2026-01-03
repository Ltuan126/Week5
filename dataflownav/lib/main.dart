import 'package:flutter/material.dart';
import 'screens/forgot_password_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTH SmartTasks',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ForgotPasswordScreen(),
    );
  }
}
