import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:splash_app/constants/app_colors.dart';
import 'package:splash_app/services/database_service.dart'; // Adjust path if needed

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<DataSnapshot> _productsFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future once so it doesn't refetch on every screen rebuild
    _productsFuture = DatabaseService.getAllProducts();
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _productsFuture = DatabaseService.getAllProducts();
    });
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
          'Products',
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.redPink,
        elevation: 6,
        shape: const CircleBorder(),
        child: const Icon(Icons.add,
            color: AppColors.white, size: 28),
        onPressed: () {
          Navigator.pushNamed(context, '/add-product');
        },
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.black,
          onRefresh: _refreshProducts,
          child: FutureBuilder<DataSnapshot>(
            future: _productsFuture,
            builder: (context, snapshot) {
              // 1. Handle Loading State
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.black),
                );
              }

              // 2. Handle Errors
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error loading products: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              // 3. Handle Empty State
              if (!snapshot.hasData || snapshot.data?.value == null) {
                return _buildEmptyState();
              }

              // 4. Parse Firebase Data
              final Map<dynamic, dynamic> productsMap =
                  snapshot.data!.value as Map<dynamic, dynamic>;
              
              // Convert the map of nodes into a flat list we can sort and display
              final List<Map<String, dynamic>> products = [];
              productsMap.forEach((key, value) {
                final productData = Map<String, dynamic>.from(value as Map);
                productData['id'] = key; // Store the Firebase push ID
                products.add(productData);
              });

              // Optional: Sort by creation date (newest first)
              products.sort((a, b) {
                final dateA = a['createdAt'] ?? '';
                final dateB = b['createdAt'] ?? '';
                return dateB.compareTo(dateA);
              });

              // 5. Build the List UI
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                itemCount: products.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _buildProductCard(product);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    // Safely extract values with fallbacks
    final name = product['name'] ?? 'Unknown Product';
    final category = product['category'] ?? 'Uncategorized';
    final price = product['price']?.toString() ?? '0.00';
    final quantity = product['quantity']?.toString() ?? '0';

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product-details',
          arguments: product,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grayLight),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
          // Placeholder for Product Image
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              color: Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(width: 16),
          
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280), // Grey text
                  ),
                ),
              ],
            ),
          ),
          
          // Price and Quantity
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: quantity == '0' 
                      ? const Color(0xFFFEE2E2) // Light red if out of stock
                      : const Color(0xFFDCFCE7), // Light green if in stock
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Qty: $quantity',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: quantity == '0' 
                        ? const Color(0xFFDC2626) 
                        : const Color(0xFF16A34A),
                  ),
                ),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        const Icon(
          Icons.inventory_outlined,
          size: 64,
          color: Color(0xFF9CA3AF),
        ),
        const SizedBox(height: 16),
        const Text(
          'No products found',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tap the + button to add your first product.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}