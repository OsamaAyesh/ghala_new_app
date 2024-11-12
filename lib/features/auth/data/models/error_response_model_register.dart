class ErrorResponseModel {
  final String message;
  final Map<String, List<String>> errors;

  ErrorResponseModel({
    required this.message,
    required this.errors,
  });

  // دالة لتحويل البيانات من JSON إلى Model
  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      message: json['message'] ?? '',
      errors: (json['errors'] != null)
          ? Map<String, List<String>>.from(json['errors'])
          : {},
    );
  }

  // دالة لعرض الأخطاء بشكل منسق
  String getFormattedErrors() {
    String formattedErrors = message;
    if (errors.isNotEmpty) {
      errors.forEach((key, value) {
        formattedErrors += '\n$key: ${value.join(', ')}';
      });
    }
    return formattedErrors;
  }
}
