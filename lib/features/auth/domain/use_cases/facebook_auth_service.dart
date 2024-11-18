import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  Future<User?> signInWithFacebook() async {
    // تسجيل الدخول باستخدام Facebook
    final LoginResult result = await FacebookAuth.instance.login();

    // التحقق من نجاح تسجيل الدخول
    if (result.status != LoginStatus.success) {
      print('فشل تسجيل الدخول باستخدام Facebook: ${result.message}');
      return null;
    }

    // الحصول على رمز الوصول (Access Token)
    final String? token = result.accessToken?.tokenString;
    if (token == null) {
      print('فشل في الحصول على رمز الوصول من Facebook');
      return null;
    }

    // إنشاء بيانات الاعتماد لـ Firebase
    final OAuthCredential credential =
    FacebookAuthProvider.credential(token);

    // تسجيل الدخول إلى Firebase
    final userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  }
}
