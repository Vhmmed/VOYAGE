import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/shared/widgets/custom_text_field.dart';
import 'package:voyga/shared/widgets/custom_button.dart';
import 'package:voyga/shared/views/root_shell.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> _createAccount() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    if (passwordController.text != confirmPasswordController.text) {
      showMessage('كلمة المرور غير متطابقة');
      return;
    }

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmPasswordController.clear();

    setState(() => _isLoading = false);

    showMessage('تم إنشاء الحساب بنجاح');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RootShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.08),
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
                          label: 'FULL NAME',
                          hint: 'Ali',
                          icon: Icons.person_outline,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
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
                          label: 'PHONE NUMBER',
                          hint: '+20 123 456 7890',
                          icon: Icons.phone_android_outlined,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter phone number';
                            }

                            if (value.length < 11) {
                              return 'Invalid phone number';
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
                        const SizedBox(height: 24),
                        CustomTextField(
                          label: 'CONFIRM PASSWORD',
                          hint: '••••••••',
                          icon: Icons.lock_outline,
                          isPassword: true,
                          controller: confirmPasswordController,
                          textInputAction: TextInputAction.done,
                          onSubmitted: _createAccount,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm password';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                text: 'Create Account',
                                onPressed: _createAccount,
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
                              'Already a member?',
                              style: TextStyle(color: AppTheme.greyText),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Log In',
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
                  SizedBox(height: screenHeight * 0.05),
                ],
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
              )
            ],
          ),
        ),
        child: const Icon(Icons.help_outline),
        backgroundColor: AppTheme.brightBlue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
