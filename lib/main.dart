import 'package:flutter/material.dart';
import 'package:mobile_project/pages/SplashScreen.dart';
void main() {
  runApp(const E_Commerce_App());
}

class E_Commerce_App extends StatelessWidget {
  const E_Commerce_App({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}