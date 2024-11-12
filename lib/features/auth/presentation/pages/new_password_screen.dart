import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/inested_of_accounts.dart';
import '../widgets/text_field_auth.dart';
import '../widgets/verification_code_text_field.dart';
import 'login_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late TextEditingController newPasswordTextEditingController;

  late TextEditingController confirmNewPasswordTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    newPasswordTextEditingController = TextEditingController();
    confirmNewPasswordTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newPasswordTextEditingController.dispose();
    confirmNewPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        title: Text(
          context.localizations.loginFormFilledText1,
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
                    padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left: ScreenUtilNew.width(16)),
                    child: Text(
                      context.localizations.loginFormFilledText2,
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp),
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(8)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Text(
                      context.localizations.loginFormFilledText3,
                      style: GoogleFonts.cairo(
                          color: AppColors.colorResidential,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Text(
                      context.localizations.loginFormFilledText4,
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
                      hintText: AppStrings.newPasswordText5,
                      suffixIcon: Icons.lock_outline_sharp,
                      textEditingController: newPasswordTextEditingController,
                      obscureText: true,
                      prefixIcon: true,
                      suffixIconColor: AppColors.colorPurpleInLogin, nameValidator: (String? value) {  },
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtilNew.height(24),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtilNew.width(16),
                    ),
                    child: Text(
                      context.localizations.loginFormFilledText5,
                      style: GoogleFonts.cairo(
                        color: AppColors.colorResidential,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(8)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtilNew.width(16)),
                    child: TextFieldAuth(
                      onChanged: (_) {},
                      hintText: AppStrings.newPasswordText7,
                      suffixIcon: Icons.lock_outline_sharp,
                      textEditingController:
                          confirmNewPasswordTextEditingController,
                      obscureText: true,
                      prefixIcon: true,
                      suffixIconColor: AppColors.colorPurpleInLogin, nameValidator: (String? value) {  },
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(32)),
                  CustomButton(
                      onPressed: () async {
                        await _checkData();
                        // _settingModalBottomSheet(context);
                      },
                      text: context.localizations.loginFormFilledText6,
                      backgroundColor: AppColors.colorPurpleInLogin,
                      padding: ScreenUtilNew.width(16)),
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
                  bc.localizations.loginFormFilledText7,
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
                    bc.localizations.loginFormFilledText8,
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
                    text: bc.localizations.loginFormFilledText9,
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
                  bc.localizations.loginFormFilledText10,
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
                    bc.localizations.loginFormFilledText11,
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
                    text: bc.localizations.loginFormFilledText12,
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
    if (newPasswordTextEditingController.text.isNotEmpty &&
        confirmNewPasswordTextEditingController.text.isNotEmpty) {
      // ignore: use_build_context_synchronously
      if (newPasswordTextEditingController.text ==
          confirmNewPasswordTextEditingController.text) {
        _settingModalBottomSheet(context);
      } else {
        _cancelModalBottomSheet(context);
      }
    } else {
      _cancelModalBottomSheet(context);
    }
    // ignore: use_build_context_synchronously
  }
}
