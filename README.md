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
