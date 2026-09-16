import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/screens/user/profile_screen.dart';
import 'package:splash_app/widgets/custom_button.dart';
import 'package:splash_app/widgets/custom_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 72,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 6.0, bottom: 6.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: AppColors.black),
            ),
          ),
        ),
        title: Image.asset(
          height: 32,
          'assets/images/icons/logo.png',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/avatars/avatar_boy1.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _searchField(context),
            const SizedBox(height: 16),
            _featureSection(context),
            // const SizedBox(height: 16),
            // _categoriesSection(context),
            const SizedBox(height: 16),
            _productList(context),
          ],
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return const CustomTextFormField(
      borderRadius: 16,
      hintText: 'Search product',
      prefixIcon: Icon(Icons.search),
      suffixIcon: Icon(Icons.mic),
    );
  }

  Widget _featureSection(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'All Features',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
            text: 'Sort',
            backIcon: Icons.sort_sharp,
            onPressed: null,
            backgroundColor: AppColors.grayLight,
            textColor: AppColors.black,
            fontSize: 16,
            borderRadius: 12,
            width: 90,
            height: 40,
          ),
          SizedBox(width: 8),
          CustomButton(
            text: 'Filters',
            backIcon: Icons.filter_alt,
            onPressed: null,
            backgroundColor: AppColors.grayLight,
            textColor: AppColors.black,
            fontSize: 16,
            borderRadius: 12,
            width: 90,
            height: 40,
          ),
        ])
      ],
    );
  }

  Widget _categoriesSection(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
            text: 'View All',
            backIcon: Icons.arrow_forward,
            onPressed: null,
            backgroundColor: AppColors.grayLight,
            textColor: AppColors.black,
            fontSize: 16,
            borderRadius: 12,
            width: 90,
            height: 40,
          ),
          SizedBox(width: 8),
          CustomButton(
            text: 'Filters',
            backIcon: Icons.filter_alt,
            onPressed: null,
            backgroundColor: AppColors.grayLight,
            textColor: AppColors.black,
            fontSize: 16,
            borderRadius: 12,
            width: 90,
            height: 40,
          ),
        ])
      ],
    );
  }

  Widget _productList(BuildContext context) {
    return const Text(
      'Product list',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    );
  }
}
