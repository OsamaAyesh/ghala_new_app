// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart'; // لمتابعة حالة الاتصال بالإنترنت
// import '../../data/models/error_response_model_register.dart';
// import '../../data/models/register_response_model.dart';
//
// class RegisterService {
//   static const String registerUrl = 'https://chat.localproductsnetwork.com/api/auth/register';
//
//   Future<dynamic> registerUser(BuildContext context,{
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     Locale currentLocale = Localizations.localeOf(context);
//
//     // طباعة اللغة الحالية
//     print("Current language: ${currentLocale.languageCode}");
//     try {
//       // التحقق من حالة الإنترنت
//       var connectivityResult = await Connectivity().checkConnectivity();
//       if (connectivityResult == ConnectivityResult.none) {
//         return ErrorResponseModel(
//           message: 'No internet connection',
//           errors: {},
//         );
//       }
//
//       // ترميز البيانات بشكل x-www-form-urlencoded
//       final Map<String, String> body = {
//         'name': name,
//         'email': email,
//         'password': password,
//       };
//
//       final response = await http.post(
//         Uri.parse(registerUrl),
//         headers: {'Content-Type': 'application/x-www-form-urlencoded'},
//         body: body, // إرسال البيانات بهذا الشكل بدلاً من jsonEncode
//       );
//
//       // التعامل مع استجابة الخادم
//       if (response.statusCode == 200) {
//         // إذا كان التسجيل ناجحاً
//         return RegisterResponseModel.fromJson(jsonDecode(response.body));
//       } else if (response.statusCode == 422) {
//         // إذا كانت المدخلات غير صحيحة (مثل البريد الإلكتروني المستخدم مسبقاً)
//         return ErrorResponseModel.fromJson(jsonDecode(response.body));
//       } else if (response.statusCode == 400) {
//         // إذا كانت هناك مشكلة في الطلب
//         return ErrorResponseModel(
//           message: currentLocale.languageCode=="en"?'Bad request. Please check your inputs.':"طلب خاطئ. يرجى التحقق من بياناتك.",
//           errors: {},
//         );
//       } else if (response.statusCode == 401) {
//         // إذا كانت البيانات غير صحيحة أو غير مصرح بها
//         return ErrorResponseModel(
//           message:currentLocale.languageCode=="en"? 'Unauthorized access. Invalid credentials.':"الوصول غير المصرح به. بيانات اعتماد غير صالحة.",
//           errors: {},
//         );
//       } else if (response.statusCode == 404) {
//         // إذا كانت الصفحة أو المورد غير موجود
//         return ErrorResponseModel(
//           message:currentLocale.languageCode=="en"?  'Resource not found.':"لم يتم العثور على المورد.",
//           errors: {},
//         );
//       } else if (response.statusCode == 500) {
//         // إذا كانت هناك مشكلة في الخادم
//         return ErrorResponseModel(
//           message: currentLocale.languageCode=="en"?'Internal server error. Please try again later.':"خطأ داخلي في الخادم. يرجى المحاولة مرة أخرى لاحقًا.",
//           errors: {},
//         );
//       } else {
//         // في حالة استجابة غير متوقعة
//         print(response.statusCode);
//         print(response.body);
//         return ErrorResponseModel(
//           message: currentLocale.languageCode=="en"?'Unexpected error occurred.':"حدث خطأ غير متوقع.",
//           errors: {},
//         );
//       }
//     } catch (error) {
//       // في حالة حدوث خطأ في الاتصال (ضعف الإنترنت أو انقطاعه)
//       return ErrorResponseModel(
//         message: currentLocale.languageCode=="en"?'Failed to connect to the server. Please check your internet connection.':"فشل الاتصال بالخادم. يرجى التحقق من اتصالك بالإنترنت.",
//         errors: {},
//       );
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // لمتابعة حالة الاتصال بالإنترنت
import '../../data/models/error_response_model_register.dart';
import '../../data/models/register_response_model.dart';

class RegisterService {
  static const String registerUrl = 'https://chat.localproductsnetwork.com/api/auth/register';

  Future<dynamic> registerUser(BuildContext context, {
    required String name,
    required String email,
    required String password,
  }) async {
    Locale currentLocale = Localizations.localeOf(context);

    // طباعة اللغة الحالية
    print("Current language: ${currentLocale.languageCode}");
    try {
      // التحقق من حالة الإنترنت
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return ErrorResponseModel(
          message: 'No internet connection',
          errors: {},
        );
      }

      // ترميز البيانات بشكل x-www-form-urlencoded
      final Map<String, String> body = {
        'name': name,
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );

      // التعامل مع استجابة الخادم
      if (response.statusCode == 200) {
        // إذا كان التسجيل ناجحاً
        return RegisterResponseModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 422) {
        // استخراج الأخطاء عند وجود إدخال غير صحيح
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        String message = responseBody['message'] ?? "Invalid input data";
        Map<String, List<String>> errors = {};

        if (responseBody.containsKey('errors')) {
          // استخراج تفاصيل الأخطاء
          Map<String, dynamic> errorDetails = responseBody['errors'];
          errorDetails.forEach((key, value) {
            if (value is List) {
              errors[key] = List<String>.from(value);
            }
          });
        }

        // طباعة الأخطاء للمساعدة في التصحيح
        print("Error Message: $message");
        print("Error Details: $errors");

        return ErrorResponseModel(
          message: message,
          errors: errors,
        );
      } else if (response.statusCode == 400) {
        return ErrorResponseModel(
          message: currentLocale.languageCode == "en"
              ? 'Bad request. Please check your inputs.'
              : "طلب خاطئ. يرجى التحقق من بياناتك.",
          errors: {},
        );
      } else if (response.statusCode == 401) {
        return ErrorResponseModel(
          message: currentLocale.languageCode == "en"
              ? 'Unauthorized access. Invalid credentials.'
              : "الوصول غير المصرح به. بيانات اعتماد غير صالحة.",
          errors: {},
        );
      } else if (response.statusCode == 404) {
        return ErrorResponseModel(
          message: currentLocale.languageCode == "en"
              ? 'Resource not found.'
              : "لم يتم العثور على المورد.",
          errors: {},
        );
      } else if (response.statusCode == 500) {
        return ErrorResponseModel(
          message: currentLocale.languageCode == "en"
              ? 'Internal server error. Please try again later.'
              : "خطأ داخلي في الخادم. يرجى المحاولة مرة أخرى لاحقًا.",
          errors: {},
        );
      } else if(response.statusCode == 422){
        print(response.statusCode);
        print(response.body);
        return ErrorResponseModel(
          message: currentLocale.languageCode == "en"
              ? 'text'
              : "حدث خطأ غير متوقع.",
          errors: {},
        );
      }else{
        return ErrorResponseModel(
          message: currentLocale.languageCode == "en"
              ? 'Unexpected error occurred.'
              : "حدث خطأ غير متوقع.",
          errors: {},
        );
      }
    } catch (error) {
      return ErrorResponseModel(
        message: currentLocale.languageCode == "en"
            ? 'Failed to connect to the server. Please check your internet connection.'
            : "فشل الاتصال بالخادم. يرجى التحقق من اتصالك بالإنترنت.",
        errors: {},
      );
    }
  }
}
