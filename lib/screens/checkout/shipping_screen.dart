import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/widgets/bottom_navigation_bar.dart';
import 'package:splash_app/widgets/custom_popup_modal.dart';
import 'package:splash_app/widgets/primary_button.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  int _selectedPaymentIndex = 0;
  bool _isLoading = false;

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
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInvoice(),
            const SizedBox(height: 24),
            const Text(
              'Payment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            _buildPaymentOption(
              index: 0,
              brandText: 'VISA',
              brandColor: AppColors.darkBlue,
              isVisa: true,
              cardNumber: '*********2109',
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(
              index: 1,
              brandText: 'PayPal',
              brandColor: AppColors.darkBlue,
              isPayPal: true,
              cardNumber: '*********2109',
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(
              index: 2,
              brandText: 'Maestro',
              brandColor: AppColors.redPink,
              isMaestro: true,
              cardNumber: '*********2109',
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(
              index: 3,
              brandText: 'Apple Pay',
              brandColor: AppColors.black,
              isApplePay: true,
              cardNumber: '*********2109',
            ),
            const SizedBox(height: 32),
            SizedBox(
                width: double.infinity,
                height: 56,
                child: PrimaryButton(
                    text: 'Continue',
                    isLoading: _isLoading,
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() => _isLoading = false);

                      if (!context.mounted) return;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomPopupModal(
                            backgroundColor: AppColors.white,
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/star.png',
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.contain,
                                      ),
                                      const Icon(
                                        Icons.done,
                                        color: AppColors.white,
                                        size: 56,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            content: const Text(
                              'Payment done successfully.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      );
                    })),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: AppColors.redPink,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart_outlined,
            color: AppColors.white, size: 28),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: -1,
        onTabTapped: (index) {
          Navigator.pop(context, index);
        },
      ),
    );
  }

  Widget _buildInvoice() {
    return Column(
      children: [
        _buildInvoiceRow('Order', '\$ 7,000'),
        const SizedBox(height: 16),
        _buildInvoiceRow('Shipping', '\$ 30'),
        const SizedBox(height: 16),
        _buildInvoiceRow('Tax', '\$ 540'),
        const SizedBox(height: 16),
        _buildInvoiceRow('Total', '\$ 7,570', isTotal: true),
        const SizedBox(height: 20),
        const Divider(color: AppColors.divider, thickness: 1),
      ],
    );
  }

  Widget _buildPaymentOption({
    required int index,
    required String brandText,
    required Color brandColor,
    required String cardNumber,
    bool isVisa = false,
    bool isPayPal = false,
    bool isMaestro = false,
    bool isApplePay = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentIndex = index;
        });
      },
      child: _buildPaymentMethod(
        brandText: brandText,
        brandColor: brandColor,
        cardNumber: cardNumber,
        isSelected: _selectedPaymentIndex == index,
        isVisa: isVisa,
        isPayPal: isPayPal,
        isMaestro: isMaestro,
        isApplePay: isApplePay,
      ),
    );
  }

  Widget _buildInvoiceRow(String title, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isTotal ? AppColors.black : AppColors.grayText,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            color: isTotal ? AppColors.black : AppColors.grayText,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod({
    required String brandText,
    required Color brandColor,
    required String cardNumber,
    required bool isSelected,
    bool isVisa = false,
    bool isPayPal = false,
    bool isMaestro = false,
    bool isApplePay = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.white
            : AppColors.grayText.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(color: AppColors.redPink, width: 1.5)
            : Border.all(
                color: AppColors.grayText.withValues(alpha: 0.1), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBrandLogo(
              isVisa, isPayPal, isMaestro, isApplePay, brandText, brandColor),
          Text(
            cardNumber,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandLogo(bool isVisa, bool isPayPal, bool isMaestro,
      bool isApplePay, String brandText, Color brandColor) {
    if (isVisa) {
      return SizedBox(
        width: 48,
        height: 24,
        child: Image.asset('assets/images/icons/visa.png'),
      );
    } else if (isPayPal) {
      return SizedBox(
        width: 75,
        height: 20,
        child: Image.asset('assets/images/icons/paypal.png'),
      );
    } else if (isMaestro) {
      return SizedBox(
        width: 32,
        height: 20,
        child: Image.asset('assets/images/icons/maestro.png'),
      );
    } else if (isApplePay) {
      return SizedBox(
        width: 24,
        height: 24,
        child: Image.asset('assets/images/icons/apple.png'),
      );
    }
    return Text(
      brandText,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: brandColor,
      ),
    );
  }
}
