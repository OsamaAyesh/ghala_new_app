import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthService {
  Future<void> signInWithPhone(String phoneNumber, Function(String) onCodeSent) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('فشل التحقق: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId); // استخدم هذا المعرف لاحقًا.
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
