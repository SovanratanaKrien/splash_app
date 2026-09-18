import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/screens/authenticator/login_screen.dart';
import 'package:splash_app/screens/authenticator/signup_screen.dart';
import 'package:splash_app/screens/checkout/add_payment_screen.dart';
import 'package:splash_app/screens/checkout/check_out_screen.dart';
import 'package:splash_app/screens/checkout/place_order_screen.dart';
import 'package:splash_app/screens/checkout/shipping_screen.dart';
import 'package:splash_app/screens/main_screen.dart';
import 'package:splash_app/screens/onboard/onboard_screen.dart';
import 'package:splash_app/screens/product/add_product_screen.dart';
import 'package:splash_app/screens/product/product_details_screen.dart';
import 'package:splash_app/screens/product/product_list_screen.dart';
import 'package:splash_app/screens/splash_screen.dart';
import 'package:splash_app/screens/user/profile_edit_screen.dart';
import 'package:splash_app/screens/user/profile_screen.dart';
import 'package:splash_app/screens/user/setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const MainScreen(),
        '/main': (context) => const MainScreen(),
        '/onboard': (context) => const OnboardScreen(),
        // auth screens
        '/login': (context) => const LoginScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        // '/forgot-password': (context) => const ForgotPasswordScreen(),
        // '/reset-password': (context) => const ResetPasswordScreen(),
        // '/verify-email': (context) => const VerifyEmailScreen(),

        // checkout screens
        '/checkout': (context) => const CheckoutScreen(),
        '/shipping': (context) => const ShippingScreen(),
        '/add-payment': (context) => const AddPaymentScreen(),
        '/payment': (context) => const AddPaymentScreen(),
        '/place-order': (context) => const PlaceOrderScreen(),
        // '/order-success': (context) => const OrderSuccessScreen(),
        // '/order-details': (context) => const OrderDetailsScreen(),

        // products screens
        '/add-product': (context) => const AddProductScreen(),
        '/product-list': (context) => const ProductListScreen(),
        // '/product-search': (context) => const ProductSearchScreen(),
        // '/product-filter': (context) => const ProductFilterScreen(),
        // '/product-category': (context) => const ProductCategoryScreen(),
        // '/product-category-list': (context) => const ProductCategoryListScreen(),
        // '/product-category-search': (context) => const ProductCategorySearchScreen(),
        // '/product-category-filter': (context) => const ProductCategoryFilterScreen(),
        // '/product-category-detail': (context) => const ProductCategoryDetailScreen(),

        // profile screens
        // '/profile': (context) => const ProfileScreen(),
        // '/profile-edit': (context) => const ProfileEditScreen(),
        // '/profile-address': (context) => const ProfileAddressScreen(),
        // '/profile-payment': (context) => const ProfilePaymentScreen(),
        // '/profile-order': (context) => const ProfileOrderScreen(),
        // '/profile-order-detail': (context) => const ProfileOrderDetailScreen(),
        // '/profile-order-cancel': (context) => const ProfileOrderCancelScreen(),
        // '/profile-order-return': (context) => const ProfileOrderReturnScreen(),
        // '/profile-order-return-detail': (context) => const ProfileOrderReturnDetailScreen(),
        // '/profile-order-return-cancel': (context) => const ProfileOrderReturnCancelScreen(),
        // '/profile-order-return-cancel-detail': (context) => const ProfileOrderReturnCancelDetailScreen(),

        // user screens
        '/profile': (context) => const ProfileScreen(),
        '/profile-setting': (context) => const SettingScreen(),
        '/profile-edit': (context) => const ProfileEditScreen(),
        // '/user-address': (context) => const UserAddressScreen(),
        // '/user-address-edit': (context) => const UserAddressEditScreen(),
        // '/user-address-add': (context) => const UserAddressAddScreen(),
        // '/user-payment': (context) => const UserPaymentScreen(),
        // '/user-payment-edit': (context) => const UserPaymentEditScreen(),
        // '/user-payment-add': (context) => const UserPaymentAddScreen(),
        // '/user-order': (context) => const UserOrderScreen(),
        // '/user-order-detail': (context) => const UserOrderDetailScreen(),
        // '/user-order-cancel': (context) => const UserOrderCancelScreen(),
        // '/user-order-return': (context) => const UserOrderReturnScreen(),
        // '/user-order-return-detail': (context) => const UserOrderReturnDetailScreen(),
        // '/user-order-return-cancel': (context) => const UserOrderReturnCancelScreen(),
        // '/user-order-return-cancel-detail': (context) => const UserOrderReturnCancelDetailScreen(),

        // cart screens
        // '/cart': (context) => const CartScreen(),
        // '/cart-empty': (context) => const CartEmptyScreen(),
        // '/cart-coupon': (context) => const CartCouponScreen(),
        // '/cart-success': (context) => const CartSuccessScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/product-details') {
          final product = settings.arguments;
          if (product is Map<String, dynamic>) {
            return MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
              settings: settings,
            );
          }
        }
        return null;
      },
    );
  }
}
