class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? avatarUrl;

  UserModel({
    required this.id,
    required this.email,
    this.name,
    this.avatarUrl,
  });

  // تحويل من Map إلى UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? json['user_id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? json['full_name'],
      avatarUrl: json['avatar_url'] ?? json['profile_image'],
    );
  }

  // تحويل UserModel إلى Map
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'avatar_url': avatarUrl,
      };

  // يمكنك إضافة override لـ toString إذا احتجت
  @override
  String toString() => 'UserModel(id: $id, email: $email)';
}