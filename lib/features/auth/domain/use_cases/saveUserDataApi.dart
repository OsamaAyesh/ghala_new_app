// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// Future<void> saveUserDataToApi(User user) async {
//   final String apiUrl = 'https://your-api.com/users'; // استبدل بـ API الخاص بك
//
//   try {
//     // إعداد البيانات في صيغة JSON
//     final Map<String, dynamic> userData = {
//       'name': user.displayName ?? 'Unknown', // الاسم
//       'email': user.email ?? 'Unknown', // البريد الإلكتروني
//       'photoURL': user.photoURL ?? '', // رابط الصورة
//       'uid': user.uid, // معرف المستخدم
//       'loginMethod': user.providerData.map((e) => e.providerId).toList(), // طريقة تسجيل الدخول
//     };
//
//     // إرسال البيانات عبر طلب POST
//     final http.Response response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {
//         'Content-Type': 'application/json', // نوع البيانات المرسلة
//         'Authorization': 'Bearer YOUR_API_TOKEN', // إذا كانت API تحتاج توثيق
//       },
//       body: jsonEncode(userData),
//     );
//
//     // التحقق من نجاح الطلب
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print('تم حفظ البيانات بنجاح');
//     } else {
//       print('فشل حفظ البيانات: ${response.body}');
//     }
//   } catch (e) {
//     print('حدث خطأ أثناء حفظ البيانات: $e');
//   }
// }
