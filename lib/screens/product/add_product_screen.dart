import 'package:flutter/material.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/widgets/custom_image_field.dart';
import 'package:splash_app/widgets/custom_popup_modal.dart';
import 'package:splash_app/widgets/custom_select_field.dart';
import 'package:splash_app/widgets/custom_text_field.dart';
import 'package:splash_app/services/database_service.dart';
import 'package:splash_app/widgets/primary_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productCategoryController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController = TextEditingController();

  @override
  void dispose() {
    productCategoryController.dispose();
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }

  Future<void> _saveProduct() async {
    final productData = {
      'category': productCategoryController.text,
      'name': productNameController.text,
      'description': productDescriptionController.text,
      'price': double.tryParse(productPriceController.text) ?? 0.0,
      'quantity': int.tryParse(productQuantityController.text) ?? 0,
    };
    await DatabaseService.saveProduct(productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Add Product',
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              CustomImageField(
                label: 'Product Image',
                onImageSelected: (image) {
                  // Handle image selection
                },
              ),
              const SizedBox(height: 16), // Added missing spacing
              CustomSelectField(
                controller: productCategoryController, 
                label: 'Category',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: productNameController, 
                label: 'Name',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: productDescriptionController, 
                label: 'Description',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: productPriceController, 
                      label: 'Price',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: productQuantityController, 
                      label: 'Quantity',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildSaveButton(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  
  // ---------- Save Product Button ----------
  Widget _buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: PrimaryButton(text: 'Save Product', onPressed: () async {
          try {
            await _saveProduct();
            if (!mounted) return;
              await showDialog<void>(
                context: this.context,
                builder: (BuildContext context) {
                  return const CustomPopupModal(
                    title: Text('Product Saved'),
                    content: Text('Your product has been successfully saved.'),
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
                      'An error occurred while saving your product. Please try again.',
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}