import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/auth_with_phone_number.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/terms_and_condition.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../manager/providers/terms_and_condition_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/gradient_text.dart';
import '../widgets/image_background.dart';
import '../widgets/inested_of_accounts.dart';
import '../widgets/package_login_methods.dart';
import '../widgets/text_field_auth.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController userNameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  bool valueCheckBox = false;

  @override
  void initState() {
    // TODO: implement initState
    userNameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          context.localizations.signUPScreenText1,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            color: AppColors.colorPurpleInLogin,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          const ImageBackground(),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: ScreenUtilNew.height(124)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: GradientText(
                      text: context.localizations.signUPScreenText2,
                      gradient: const LinearGradient(colors: [
                        AppColors.colorPurpleInLogin,
                        Colors.black,
                      ]),
                      style: GoogleFonts.cairo(
                        fontSize: 24.sp,
                        color: AppColors.colorPurpleInLogin,
                        fontWeight: FontWeight.bold,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(32),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: Text(
                    context.localizations.signUPScreenText3,
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
                  padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: TextFieldAuth(
                    hintText: AppStrings.signUpScreen4,
                    suffixIcon: Icons.person,
                    textEditingController: userNameTextEditingController,
                    obscureText: false,
                    prefixIcon: false,
                    suffixIconColor: AppColors.colorPurpleInLogin,
                    onChanged: (String) {},
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(16),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: Text(
                    context.localizations.signUPScreenText4,
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
                  padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: TextFieldAuth(
                    hintText: AppStrings.signUpScreen6,
                    suffixIcon: Icons.email_outlined,
                    textEditingController: emailTextEditingController,
                    obscureText: false,
                    prefixIcon: false,
                    suffixIconColor: AppColors.colorPurpleInLogin,
                    onChanged: (String) {},
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(16),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.height(16)),
                  child: Text(
                    context.localizations.signUPScreenText5,
                    style: GoogleFonts.cairo(
                      color: AppColors.colorResidential,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.width(8),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: TextFieldAuth(
                    hintText: AppStrings.signUpScreen8,
                    suffixIcon: Icons.email_outlined,
                    textEditingController: passwordTextEditingController,
                    obscureText: true,
                    prefixIcon: true,
                    suffixIconColor: AppColors.colorPurpleInLogin,
                    onChanged: (String) {},
                  ),
                ),
                SizedBox(height: ScreenUtilNew.height(8),),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(PageAnimationTransition(
                        page: const TermsAndCondition(),
                        pageAnimationType: BottomToTopTransition()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Row(
                      children: [
                        Selector<TermsAndConditionController, bool>(
                          selector: (context, controller) => controller.isAccepted,
                          builder: (context, isAccepted, child) {
                            return Container(
                              height: ScreenUtilNew.height(16),
                              width: ScreenUtilNew.width(16),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isAccepted?AppColors.colorPurpleInLogin:AppColors.colorResidential
                              ),
                              child: isAccepted? const Icon(Icons.done,color: Colors.white,size: 8,):null,
                            );
                          },
                        ),
                        SizedBox(width: ScreenUtilNew.width(8),),
                        Text(
                          context.localizations.signUpScreenText6,
                          style: GoogleFonts.cairo(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.colorPurpleInLogin),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtilNew.height(8),),
                CustomButton(
                  onPressed: () {
                    _checkData();
                  },
                  text: context.localizations.signUPScreenText7,
                  backgroundColor: AppColors.colorPurpleInLogin,
                  padding: ScreenUtilNew.width(16),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(24),
                ),
                Center(
                  child: Text(
                    context.localizations.signUPScreenText8,
                    style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF4B4B4B),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(24),
                ),
                PackageLoginMethods(
                    onTapFacebook: () {},
                    onTapPhone: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: const AuthWithPhoneNumber(),
                          pageAnimationType: LeftToRightTransition()));
                    },
                    onTapGmail: () {},
                    onTapApple: () {}),
                SizedBox(
                  height: ScreenUtilNew.height(24),
                ),
                InestedOfAccounts(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/login_screen");
                    },
                    textButton: context.localizations.signUPScreenText10,
                    textWithTextButton: context.localizations.signUPScreenText9),
                SizedBox(
                  height: ScreenUtilNew.height(24),
                ),
              ],
            ),
          ),
        )
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    bool isDisable = false;
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r)),
      ),
      builder: (BuildContext bc) {
        return SizedBox(
          height: ScreenUtilNew.height(400),
          width: ScreenUtilNew.width(375),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AssetsManger.successImage,
                  height: ScreenUtilNew.height(180),
                  width: ScreenUtilNew.width(180),
                  fit: BoxFit.contain,
                ),
                SizedBox(height: ScreenUtilNew.height(16)),
                Text(
                  AppStrings.successStringSignUpScreen,
                  style: GoogleFonts.cairo(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0XFF00CB39),
                  ),
                ),
                SizedBox(height: ScreenUtilNew.height(16)),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(80)),
                  child: Text(
                    AppStrings.successSubTitleStringSignUpScreen,
                    style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF9C9C9C)),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(16),
                ),
                CustomButton(
                    onPressed: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: const LoginScreen(),
                          pageAnimationType: BottomToTopTransition()));
                    },
                    text: AppStrings.successString3NewPassword,
                    backgroundColor: const Color(0XFF00CB39),
                    padding: ScreenUtilNew.width(16)),
                SizedBox(
                  height: ScreenUtilNew.height(32),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _cancelModalBottomSheet(context) {
    bool isDisable = false;
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r)),
      ),
      builder: (BuildContext bc) {
        return SizedBox(
          height: ScreenUtilNew.height(400),
          width: ScreenUtilNew.width(375),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtilNew.height(16),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsManger.cancelImage,
                    height: ScreenUtilNew.height(180),
                    width: ScreenUtilNew.width(180),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(16),
                ),
                Text(
                  AppStrings.errorStringSignUpScreen,
                  style: GoogleFonts.cairo(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0XFFFF0000),
                  ),
                ),
                SizedBox(height: ScreenUtilNew.height(16)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtilNew.height(80)),
                  child: Text(
                    AppStrings.errorSubTitleSignUpScreen,
                    style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF9C9C9C)),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: ScreenUtilNew.height(32)),
                CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: AppStrings.cancelString3NewPassword,
                    backgroundColor: const Color(0XFFFF0000),
                    padding: ScreenUtilNew.width(16)),
                SizedBox(
                  height: ScreenUtilNew.height(32),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _checkData() async {
    if (userNameTextEditingController.text.isNotEmpty &&
        emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      // ignore: use_build_context_synchronously
      _settingModalBottomSheet(context);
    } else {
      _cancelModalBottomSheet(context);
    }
    // ignore: use_build_context_synchronously
  }
}
