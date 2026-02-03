import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  ProfileScreen({super.key, required this.user});

  void _continueToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen(user: user)),
    );
  }

  InputDecoration _fieldDec({required String label, Widget? suffixIcon}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue, width: 1.2),
      ),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = user.displayName ?? "Unknown";
    final email = user.email ?? "Unknown";
    final photo = user.photoURL;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 18),
          child: Column(
            children: [
              const SizedBox(height: 6),

              // Avatar + camera icon
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: photo != null ? NetworkImage(photo) : null,
                    child: photo == null
                        ? const Icon(Icons.person, size: 46, color: Colors.grey)
                        : null,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 2,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Fields
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: name),
                decoration: _fieldDec(label: ""),
              ),

              const SizedBox(height: 14),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: email),
                decoration: _fieldDec(label: ""),
              ),

              const SizedBox(height: 14),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Date of Birth",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: "23/05/1995"),
                decoration: _fieldDec(
                  label: "",
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                ),
              ),

              const Spacer(),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => _continueToHome(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Continue to SmartTasks",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
