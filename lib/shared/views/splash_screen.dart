import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/auth/views/signin_screen.dart';
import 'package:voyga/shared/views/root_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  void _goNext() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final isLoggedIn = false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const RootShell()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SigninScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppTheme.backgroundGradient),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'Voyage',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryBlue,
              letterSpacing: 4,
            ),
          ),
        ),
      ),
    );
  }
}
