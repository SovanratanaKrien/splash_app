# Splash App

An e-commerce Flutter application featuring modern UI, shopping cart, secure checkout, and multiple payment integrations.

## Features

- **Authentication**: User login, registration, and forgot password flows.
- **Navigation**: Custom bottom navigation bar for seamless user experience.
- **Shopping Cart**: View and manage items in the cart.
- **Checkout & Payment**: Detailed invoice breakdown, shipping details, and mock payment methods (VISA, PayPal, Apple Pay).
- **Responsive UI**: Built to be responsive and work seamlessly across mobile devices.

## Getting Started

Follow these steps to set up the project locally on your machine after downloading or cloning the code.

### Prerequisites

Make sure you have the following installed on your system:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0+)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE such as [VS Code](https://code.visualstudio.com/), [Android Studio](https://developer.android.com/studio), or [IntelliJ IDEA](https://www.jetbrains.com/idea/).

### Installation & Setup

1. **Clone the repository (if using Git)**
   Open your terminal and run the following command to clone the project:

   ```bash
   git clone <your-repository-url>
   ```

   _(If you downloaded the ZIP file, simply extract it to your desired folder)._

2. **Navigate to the project directory**

   ```bash
   cd splash_app
   ```

3. **Install dependencies**
   Run the following command to fetch all required Dart and Flutter packages:

   ```bash
   flutter pub get
   ```

4. **Configure Firebase**
   Make sure you have the Firebase CLI and FlutterFire CLI installed:

   ```bash
   dart pub global activate flutterfire_cli
   ```

   Then, configure Firebase for this project:

   ```bash
   flutterfire configure
   ```

   Follow the prompts to select your Firebase project. This will generate the `lib/firebase_options.dart` file required to connect the app to Firebase.

   After generating the file, make sure to update your `lib/main.dart` to initialize Firebase:

   ```dart
   import 'package:firebase_core/firebase_core.dart';
   import 'firebase_options.dart';

   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
     );
     runApp(const MyApp());
   }
   ```

   **Firebase Authentication Setup**
   If you plan to use Firebase Auth for user login/signup, make sure to add `firebase_auth` to your dependencies if it isn't already there:

   ```bash
   flutter pub add firebase_auth
   ```

   1. Go to your [Firebase Console](https://console.firebase.google.com/) and enable the **Authentication** service. Add sign-in providers like Email/Password or Google.
   2. Import and use the `FirebaseAuth` instance in your code to manage users:

   ```dart
   import 'package:firebase_auth/firebase_auth.dart';

   // Example: Sign in
   await FirebaseAuth.instance.signInWithEmailAndPassword(
     email: 'user@example.com',
     password: 'secretpassword',
   );

   // Example: Sign out
   await FirebaseAuth.instance.signOut();
   ```

   **Current Authentication Implementation**
   The app currently has a full Firebase Authentication flow set up. Here are the key code components required for these flows:
   - **Sign Up / Registration (`lib/screens/authenticator/signup_screen.dart`)**:
     To register new users, we use `createUserWithEmailAndPassword`.
     **Important**: Always wrap authentication calls in a `try-catch` block to handle Firebase exceptions like "email already in use" or "weak password".

     ```dart
     import 'package:firebase_auth/firebase_auth.dart';

     Future<void> _signUp() async {
       try {
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: _emailController.text.trim(),
           password: _passwordController.text.trim(),
         );
         // Navigate to Home or Profile
       } on FirebaseAuthException catch (e) {
         // Show error message to user
       }
     }
     ```

   - **Login (`lib/screens/authenticator/login_screen.dart`)**:
     To log in existing users, we use `signInWithEmailAndPassword`.
     **Important**: Ensure that user inputs are validated (e.g., checking for empty or malformed fields) before calling Firebase.

     ```dart
     import 'package:firebase_auth/firebase_auth.dart';

     Future<void> _login() async {
       try {
         await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: _emailController.text.trim(),
           password: _passwordController.text.trim(),
         );
         // Navigate to Main application screen
       } on FirebaseAuthException catch (e) {
         // Show error message to user
       }
     }
     ```

   - **Logout (`lib/screens/user/profile_screen.dart`)**:
     From the ProfileScreen, users can log out. It's important to provide a confirmation dialog (`CustomPopupModal`) to prevent accidental logouts.
     **Important**: After a successful `signOut()`, always redirect the user back to the Login Screen and replace the navigation stack to prevent returning to authenticated screens.

     ```dart
     import 'package:firebase_auth/firebase_auth.dart';

     // Example usage in the confirmation modal:
     onAction2Pressed: () async {
       await FirebaseAuth.instance.signOut();
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => const LoginScreen()),
       );
     }

     // Or
     onAction2Pressed: () async {
       await FirebaseAuth.instance.signOut();
       Navigator.pushReplacementNamed(context, '/login');
     }
     ```

5. **Run the application**
   Connect a physical device via USB or start a virtual emulator, then run:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/screens/`: Contains the main UI screens (e.g., `MainScreen`, `ShippingScreen`, `ForgetPasswordScreen`).
- `lib/widgets/`: Reusable UI components (e.g., `PrimaryButton`, `BottomNavBar`, `CustomPopupModal`).
- `lib/constants/`: App-wide configuration, styling, and color constants (`AppColors`).
- `assets/images/`: Images and icons used throughout the app.

## Flutter Project Structure & Best Practices

### 1. **The Foundation: Directory Structure**

**A well-organized Flutter project is critical for maintainability. Separating concerns into distinct directories within the lib folder ensures your codebase remains navigable:**

- **constants**: Houses static, unchanging values used across the application.

- **models**: Contains data classes that represent the structures of the information your app handles.

- **screens**: Holds the full-page Flutter widgets.

- **widgets**: Stores reusable, smaller UI components.

- **routes**: Manages the navigation logic.

### 2. **Deep Dive: The Constants Directory**

**The constants folder prevents you from hardcoding "magic numbers" or strings. Recommended files include:**

- **app_colors.dart**: Centralizes the color palette.

- **app_sizes.dart**: Standardizes padding, margins, and layout metrics.

- **app_strings.dart**: Collects all static text to simplify localization.

- **asset_paths.dart**: Provides a strongly-typed reference to local image and file assets.

## Common Model Files for an E-commerce App

- **user_model.dart**: This will hold data about the currently logged-in user, such as their ID, name, email address, and profile picture URL.

- **product_model.dart**: This blueprint will represent the items you sell on your shop_page_screen.dart. It should include fields like product ID, title, description, price, and image assets.

- **order_model.dart**: Used to structure the data when a user goes through the check_out_screen.dart and shipping_screen.dart. It might contain a list of products, the total price, and the shipping address.

- **payment_model.dart**: This handles transaction information, such as the payment method, transaction ID, and status (e.g., success or pending) for your payment screen

## Resources

**If you want to learn more about Flutter development:**

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter online documentation](https://docs.flutter.dev/)
