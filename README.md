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
   *(If you downloaded the ZIP file, simply extract it to your desired folder).*

2. **Navigate to the project directory**
   ```bash
   cd splash_app
   ```

3. **Install dependencies**
   Run the following command to fetch all required Dart and Flutter packages:
   ```bash
   flutter pub get
   ```

4. **Run the application**
   Connect a physical device via USB or start a virtual emulator, then run:
   ```bash
   flutter run
   ```

## Project Structure

- `lib/screens/`: Contains the main UI screens (e.g., `MainScreen`, `ShippingScreen`, `ForgetPasswordScreen`).
- `lib/widgets/`: Reusable UI components (e.g., `PrimaryButton`, `BottomNavBar`, `CustomPopupModal`).
- `lib/constants/`: App-wide configuration, styling, and color constants (`AppColors`).
- `assets/images/`: Images and icons used throughout the app.

## Resources

If you want to learn more about Flutter development:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter online documentation](https://docs.flutter.dev/)
