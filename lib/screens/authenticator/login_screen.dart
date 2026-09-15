import 'package:flutter/material.dart';
import 'package:splash_app/constants/colors.dart';
import 'package:splash_app/screens/authenticator/forget_password_screen.dart';
import 'package:splash_app/screens/authenticator/signup_screen.dart';
import 'package:splash_app/screens/main_screen.dart';
import 'package:splash_app/widgets/custom_text_field.dart';
import 'package:splash_app/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome\nBack!',
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
                if (value == null || value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPasswordScreen()),
                  );
                },
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.redPink,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.redPink,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Login',
              isLoading: _isLoading,
              padding: const EdgeInsets.only(top: 24),
              onPressed: () {
                setState(() => _isLoading = true);
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() => _isLoading = false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                  );
                });
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create an account ?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.redPink,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.redPink,
                    ),
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
