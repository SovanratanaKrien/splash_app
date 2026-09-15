import 'product_model.dart'; // Import your product model

class OrderModel {
  final String orderId;
  final List<ProductModel> products; // A list of the products ordered
  final double totalAmount;
  final String status;
  final DateTime orderDate; // Added to track when the order was placed

  OrderModel({
    required this.orderId, 
    required this.products,
    required this.totalAmount, 
    required this.status,
    required this.orderDate,
  });
}