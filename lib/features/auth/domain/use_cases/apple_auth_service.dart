import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppleAuthService {
  Future<User?> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // إنشاء بيانات الاعتماد لـ Firebase
      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // تسجيل الدخول إلى Firebase باستخدام بيانات الاعتماد
      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      return userCredential.user;
    } catch (e) {
      print('خطأ أثناء تسجيل الدخول باستخدام Apple: $e');
      return null;
    }
  }
}
