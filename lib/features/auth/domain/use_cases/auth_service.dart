import 'google_auth_service.dart';
import 'facebook_auth_service.dart';
import 'apple_auth_service.dart';
import 'phone_auth_service.dart';

class AuthService {
  final _googleAuthService = GoogleAuthService();
  final _facebookAuthService = FacebookAuthService();
  final _appleAuthService = AppleAuthService();
  final _phoneAuthService = PhoneAuthService();

  Future<void> signInWithGoogle() => _googleAuthService.signInWithGoogle();
  Future<void> signInWithFacebook() => _facebookAuthService.signInWithFacebook();
  Future<void> signInWithApple() => _appleAuthService.signInWithApple();
  Future<void> signInWithPhone(String phoneNumber, Function(String) onCodeSent) =>
      _phoneAuthService.signInWithPhone(phoneNumber, onCodeSent);
}
