// lib/screens/auth/role_selection.dart
import 'package:flutter/material.dart';
import 'package:retina_doctor/screens/auth/signup_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Role')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(role: 'patient'),
                  ),
                );
              },
              child: const Text('Sign up as Patient'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(role: 'doctor'),
                  ),
                );
              },
              child: const Text('Sign up as Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}