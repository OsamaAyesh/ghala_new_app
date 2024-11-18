import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/app_strings.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../../../home_screen/home_screen.dart';
import '../../domain/use_cases/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/gradient_text.dart';
import '../widgets/image_background.dart';
import '../widgets/inested_of_accounts.dart';
import '../widgets/package_login_methods.dart';
import '../widgets/text_field_auth.dart';
import 'auth_with_phone_number.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            context.localizations.loginScreenText1,
            style: GoogleFonts.cairo(
              fontSize: 20.sp,
              color: AppColors.colorPurpleInLogin,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            const ImageBackground(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtilNew.height(132)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtilNew.width(24)),
                      child: GradientText(
                          text: context.localizations.loginScreenText2,
                          gradient: const LinearGradient(colors: [
                            AppColors.colorPurpleInLogin,
                            Colors.black,
                          ]),
                          style: GoogleFonts.cairo(
                            fontSize: 20.sp,
                            color: AppColors.colorPurpleInLogin,
                            fontWeight: FontWeight.bold,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(32),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left:ScreenUtilNew.width(16) ),
                      child: Text(
                        context.localizations.loginScreenText3,
                        style: GoogleFonts.cairo(
                          color: AppColors.colorResidential,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtilNew.width(16)),
                      child: TextFieldAuth(
                        onChanged: (_) async{

                        },
                        hintText: AppStrings.loginText3,
                        suffixIcon: Icons.email_outlined,
                        textEditingController: emailTextEditingController,
                        obscureText: false,
                        prefixIcon: false,
                        suffixIconColor: AppColors.colorPurpleInLogin, nameValidator: (String? value) {  },
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(24),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left:ScreenUtilNew.width(16), ),
                      child: Text(
                        context.localizations.loginScreenText4,
                        style: GoogleFonts.cairo(
                          color: AppColors.colorResidential,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtilNew.width(16)),
                      child: TextFieldAuth(
                        onChanged: (_) {},
                        hintText: AppStrings.loginText5,
                        suffixIcon: Icons.lock_outline_sharp,
                        textEditingController: passwordTextEditingController,
                        obscureText: true,
                        prefixIcon: true,
                        suffixIconColor: AppColors.colorPurpleInLogin, nameValidator: (String? value) {  },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtilNew.width(16),right: ScreenUtilNew.width(16)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: const ForgetPassword(),
                              pageAnimationType: LeftToRightTransition()));
                        },
                        child: Text(
                          context.localizations.loginScreenText5,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: AppColors.colorResidential,
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(PageAnimationTransition(
                            page: const HomeScreen(),
                            pageAnimationType: LeftToRightTransition()));
                      },
                      text: context.localizations.loginScreenText6,
                      backgroundColor: AppColors.colorPurpleInLogin,
                      padding: ScreenUtilNew.width(16),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(16),
                    ),
                    Center(
                      child: Text(
                        context.localizations.loginScreenText7,
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0XFF4B4B4B),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(16),
                    ),
                    PackageLoginMethods(
                      onTapApple: () async{
                        try {
                          await _authService.signInWithApple();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم تسجيل الدخول باستخدام Apple')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('خطأ: $e')),
                          );
                        }
                      },
                      onTapFacebook: ()async {
                        try {
                          await _authService.signInWithFacebook();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم تسجيل الدخول باستخدام Facebook')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('خطأ: $e')),
                          );
                        }
                      },
                      onTapGmail: () async{
                        try {
                          await _authService.signInWithGoogle();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم تسجيل الدخول باستخدام Google')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('خطأ: $e')),
                          );
                        }
                      },
                      onTapPhone: () {
                        Navigator.of(context).push(PageAnimationTransition(
                            page: const AuthWithPhoneNumber(),
                            pageAnimationType: LeftToRightTransition()));
                      },
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(32),
                    ),
                    InestedOfAccounts(
                      onPressed: () {
                        Navigator.of(context).push(PageAnimationTransition(
                            page: const SignUpScreen(),
                            pageAnimationType: LeftToRightTransition()));
                      },
                      textButton: context.localizations.loginScreenText9,
                      textWithTextButton: context.localizations.loginScreenText8,
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(24),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
