import 'package:flutter/material.dart';
import 'package:voyga/shared/views/root_shell.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/widgets/custom_text_field.dart';
import 'package:voyga/shared/widgets/custom_button.dart';
import 'package:voyga/features/auth/views/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(48),
                        boxShadow: AppTheme.cardShadow,
                      ),
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        children: [
                          const Text(
                            'Voyage',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryBlue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Begin your next journey',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.greyText,
                            ),
                          ),
                          const SizedBox(height: 48),
                          CustomTextField(
                            label: 'EMAIL ADDRESS',
                            hint: 'ali@voyage.app',
                            icon: Icons.email_outlined,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          CustomTextField(
                            label: 'PASSWORD',
                            hint: '••••••••',
                            icon: Icons.lock_outline,
                            isPassword: true,
                            controller: passwordController,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter password';
                              }
                              if (value.length < 6) {
                                return 'Password too short';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          CustomButton(
                            text: 'Sign In',
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RootShell(),
                                  ),
                                );
                              }
                            },
                            isPrimary: true,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: AppTheme.greyText.withOpacity(0.4),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'OR JOIN WITH',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppTheme.greyText,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: AppTheme.greyText.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: 'Google',
                                  icon: Icons.g_mobiledata,
                                  onPressed: () {},
                                  isPrimary: false,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomButton(
                                  text: 'Apple',
                                  icon: Icons.apple,
                                  onPressed: () {},
                                  isPrimary: false,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(color: AppTheme.greyText),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignupScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: AppTheme.brightBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Help'),
            content: const Text('contact support@voyage.app'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        backgroundColor: AppTheme.brightBlue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.help_outline),
      ),
    );
  }
}
