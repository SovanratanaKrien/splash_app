class UserModel {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl; // Added for the user's avatar

  UserModel({
    required this.id, 
    required this.name, 
    required this.email,
    required this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImageUrl: json['profile_image_url'] ?? '',
    );
  }
}