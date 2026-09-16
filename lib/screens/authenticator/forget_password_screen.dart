import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/widgets/custom_text_field.dart';
import 'package:splash_app/widgets/primary_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forget\nPassword?',
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
              label: 'Enter your email address',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text(
                  '* We will send you a message to set or reset\nyour new password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Forget Password',
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
          ],
        ),
      ),
    );
  }
}
