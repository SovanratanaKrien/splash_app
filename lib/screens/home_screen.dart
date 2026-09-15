import 'package:flutter/material.dart';
import 'package:splash_app/constants/colors.dart';
import 'package:splash_app/screens/user/profile_screen.dart';

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            // Text(
            //   'Home Screen',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.w700,
            //     color: AppColors.black,
            //   ),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   'Profile Page',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.w400,
            //     color: AppColors.black,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
