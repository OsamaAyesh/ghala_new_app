class RegisterResponseModel {
  final bool error;
  final String message;
  final int status;
  final RegisterData? data;

  RegisterResponseModel({
    required this.error,
    required this.message,
    required this.status,
    this.data,
  });

  // دالة لتحويل البيانات من JSON إلى Model
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      error: json['error'] ?? false,
      message: json['massege'] ?? '',
      status: json['status'] ?? 0,
      data: json['data'] != null ? RegisterData.fromJson(json['data']) : null,
    );
  }
}

class RegisterData {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final int status;
  final int type;
  final String updatedAt;
  final String createdAt;

  RegisterData({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.status,
    required this.type,
    required this.updatedAt,
    required this.createdAt,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      type: json['type'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
    );
  }
}
