class UserModel {
  final String id;
  final String email;
  final String name;
  final String role;
  final String? licenseNumber;
  final bool isApproved;
  final String? specialty;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.licenseNumber,
    this.isApproved = false,
    this.specialty,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role,
      'licenseNumber': licenseNumber,
      'isApproved': isApproved,
      'specialty': specialty,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      licenseNumber: map['licenseNumber'],
      isApproved: map['isApproved'] ?? false,
      specialty: map['specialty'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
