import 'package:flutter/material.dart';
import 'package:jardin_digital/screens/splash_screen.dart';

void main() {
  runApp(const JardinDigitalApp());
}

class JardinDigitalApp extends StatelessWidget {
  const JardinDigitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jardin Digital',
      theme: ThemeData(
        primaryColor: const Color(0xFF689F38),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}