import 'package:ghala_new_app/features/auth/presentation/pages/forget_password.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/login_screen.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/new_password_screen.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/terms_and_condition.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/verification_code_email_screen.dart';
import 'package:ghala_new_app/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:ghala_new_app/features/on_boarding/presentation/pages/splash_screen.dart';

class Routes{
  //pages features - on boarding
  static const String initialRoute="/splash_screen";
  static const String onBoardingScreen="/on_boarding_screen";

  //pages features - auth
  static const String loginScreen="/login_screen";
  static const String forgetPassword="/forget_password";
  static const String verificationCodeEmailScreen="/verification_code_email_screen";
  static const String newPasswordScreen="/new_password_screen";
  static const String termsAndCondition="/terms_and_condition";
  static const String signUpScreen="/sign_up_screen";


}
final routes={
  //pages features - on boarding
  Routes.initialRoute:(context)=>const SplashScreen(),
  Routes.onBoardingScreen:(context)=>const OnBoardingScreen(),

  //pages features - auth
  Routes.loginScreen:(context)=>const LoginScreen(),
  Routes.forgetPassword:(context)=>const ForgetPassword(),
  Routes.newPasswordScreen:(context)=>const NewPasswordScreen(),
  Routes.verificationCodeEmailScreen:(context)=> VerificationCodeEmailScreen(email: ""),
  Routes.termsAndCondition:(context)=>const TermsAndCondition(),
  Routes.signUpScreen:(context)=>const SignUpScreen(),

};