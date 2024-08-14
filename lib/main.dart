import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const DenoGymApp());
}

class DenoGymApp extends StatelessWidget {
  const DenoGymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DENO GYM',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}
