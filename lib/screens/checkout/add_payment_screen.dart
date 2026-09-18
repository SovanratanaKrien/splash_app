import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/widgets/custom_text_field.dart';
import 'package:splash_app/widgets/primary_button.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Check Out',
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            _buildPersonalInfoForm(),
            _buildAddressDetails(),
            _buildBackAccountDetails(),
            const SizedBox(height: 24), // Add some spacing at the end
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: _buildSaveBtn(),
      ),
    );
  }

  // ---------- Profile Header ----------
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatars/avatar_boy1.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppColors.info,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Text(
            'Splash User',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 4),
          // const Text(
          //   'user.splash@gmail.com',
          //   style: TextStyle(fontSize: 14, color: AppColors.black),
          // ),
        ],
      ),
    );
  }

  // ---------- Personal Details ----------
  Widget _buildPersonalInfoForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.email_outlined,
            label: 'Email Address',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.lock_outline,
            label: 'Password',
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Change Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.redPink,
                decorationColor: AppColors.redPink,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Business Address Details ----------
  Widget _buildAddressDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Business Address Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.email_outlined,
            label: 'Pincode',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.lock_outline,
            label: 'Address',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.location_city,
            label: 'City',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.map,
            label: 'State',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.flag,
            label: 'Country',
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  // ---------- Back Account Details ----------
  Widget _buildBackAccountDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Back Account Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.email_outlined,
            label: 'Back Account Number',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.person,
            label: 'Account Holder Name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: Icons.lock_outline,
            label: 'IFSC Code',
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  // -------- Save Button --------
  Widget _buildSaveBtn() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: PrimaryButton(
        text: "Save",
        onPressed: () {
          Navigator.pushNamed(context, '/shipping');
        },
      ),
    );
  }
}
