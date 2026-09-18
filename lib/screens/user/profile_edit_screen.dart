import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/widgets/custom_popup_modal.dart';
import 'package:splash_app/widgets/custom_text_field.dart';
import 'package:splash_app/services/database_service.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    _displayNameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('You must be signed in to save your profile.');
    }

    await DatabaseService.saveUserProfile(user, profile: {
      'email': _emailController.text,
      'phone_number': _phoneNumberController.text,
      'display_name': _displayNameController.text,
      'address': _addressController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile Edit',
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
            const SizedBox(height: 16),
            _buildProfileEdit(context),
            const SizedBox(height: 16),
            _buildSaveProfileButton(context),
            ],
        ),
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
                // If using a local asset:
                backgroundImage: AssetImage('assets/avatars/avatar_boy1.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFF2E7D32), // primary green
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: AppColors.white,
                  ),
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
          const Text(
            'user.splash@gmail.com',
            style: TextStyle(fontSize: 14, color: AppColors.black),
          ),
        ],
      ),
    );
  }

  // ---------- Profile Edit Form ----------
  Widget _buildProfileEdit(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _emailController,
            label: 'Email',
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
            controller: _displayNameController,
            label: 'Display Name',
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your display name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _phoneNumberController,
            label: 'Phone Number',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _addressController,
            label: 'Address',
            prefixIcon: Icons.location_on_outlined,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  // ---------- Save Profile Button ----------
  Widget _buildSaveProfileButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () async {
            try {
              await _saveProfile();
              if (!mounted) return;
              await showDialog<void>(
                context: this.context,
                builder: (BuildContext context) {
                  return const CustomPopupModal(
                    title: Text('Profile Saved'),
                    content: Text('Your profile has been successfully saved.'),
                  );
                },
              );
            } catch (_) {
              if (!mounted) return;
              await showDialog<void>(
                context: this.context,
                builder: (BuildContext context) {
                  return const CustomPopupModal(
                    title: Text('Error'),
                    content: Text(
                      'An error occurred while saving your profile. Please try again.',
                    ),
                  );
                },
              );
            }
          },
          icon: const Icon(Icons.save, color: AppColors.green),
          label: const Text(
            'Save Profile',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            side: const BorderSide(color: AppColors.green),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
