class ProductModel {
  final String id;
  final String title;
  final double price;
  final String imageUrl; // Added the image field!

  ProductModel({
    required this.id, 
    required this.title, 
    required this.price,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      imageUrl: json['image_url'], // Parsing the image path from your data
    );
  }
}