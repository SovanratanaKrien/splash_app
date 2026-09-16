import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/widgets/custom_text_field.dart';
import 'package:splash_app/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureRePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an\naccount',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: _emailController,
              label: 'Username or Email',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              prefixIcon: Icons.lock_outline,
              suffixIcon: _obscurePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              onSuffixTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              obscureText: _obscurePassword,
              validator: (value) {
                if (value == null || value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _rePasswordController,
              label: 'Confirm Password',
              prefixIcon: Icons.lock_outline,
              suffixIcon: _obscureRePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              onSuffixTap: () {
                setState(() {
                  _obscureRePassword = !_obscureRePassword;
                });
              },
              obscureText: _obscureRePassword,
              validator: (value) {
                if (value == null || value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Create Account',
              isLoading: _isLoading,
              padding: const EdgeInsets.only(top: 24),
              onPressed: () {
                setState(() => _isLoading = true);
                // Simulate login
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() => _isLoading = false);
                  // Navigate or show error
                });
              },
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'By clicking the "Create Account" button, you agree\nto the Terms of Use and Privacy Policy',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grayText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
