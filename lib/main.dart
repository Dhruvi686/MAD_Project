import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/core/theme/app_theme.dart';
import 'package:flutter_firebase_app/features/auth/login_screen.dart';

// Lab 4: UI design using Flutter widgets
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
