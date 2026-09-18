import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  DatabaseService._();

  static const String databaseUrl =
      'https://splash-app-learn-default-rtdb.firebaseio.com';

  static final FirebaseDatabase instance = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: databaseUrl,
  );

  static DatabaseReference get usersReference => instance.ref('users');
  static DatabaseReference get productsReference => instance.ref('products');

  static Future<void> saveUserProfile(
    User user, {
    Map<String, Object?> profile = const {},
  }) {
    return usersReference.child(user.uid).update({
      'uid': user.uid,
      'email': user.email,
      'updatedAt': DateTime.now().toUtc().toIso8601String(),
      ...profile,
    });
  }


  static Future<void> saveProduct(Map<String, Object?> productData) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('You must be signed in to save a product.');
    }

    final productReference = productsReference.push();
    await productReference.set({
      'id': productReference.key,
      'ownerUid': user.uid,
      'updatedAt': DateTime.now().toUtc().toIso8601String(),
      ...productData,
    });
  }

  static Future<DataSnapshot> getUserProfile(String uid) {
    return usersReference.child(uid).get();
  }

  static Future<DataSnapshot> getProductByCategory(String category) {
    return productsReference.orderByChild('category').equalTo(category).get();
  }

  static Future<DataSnapshot> getAllProducts() {
    return productsReference.get();
  }

  static Future<DataSnapshot> getProductById(String productId) {
    return productsReference.child(productId).get();
  }

  static Future<void> deleteProduct(String productId) {
    return productsReference.child(productId).remove();
  }
}
