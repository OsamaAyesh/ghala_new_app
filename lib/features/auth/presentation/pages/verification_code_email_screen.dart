import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/inested_of_accounts.dart';
import '../widgets/verification_code_text_field.dart';
import 'new_password_screen.dart';

class VerificationCodeEmailScreen extends StatefulWidget {
  String email;
   VerificationCodeEmailScreen({super.key,required this.email});

  @override
  State<VerificationCodeEmailScreen> createState() =>
      _VerificationCodeEmailScreenState();
}

class _VerificationCodeEmailScreenState
    extends State<VerificationCodeEmailScreen> {
  // late FocusNode _focusNode= FocusNode();
  late TextEditingController otp1Controller;
  late TextEditingController otp2Controller;
  late TextEditingController otp3Controller;
  late TextEditingController otp4Controller;
  late Color backgroundButton;
  bool otp1Enabled = true;
  bool otp2Enabled = false;
  bool otp3Enabled = false;
  bool otp4Enabled = false;
  bool otp5Enabled = false;
  bool otp6Enabled = false;

  @override
  void initState() {
    // TODO: implement initState
    otp1Controller = TextEditingController();
    otp2Controller = TextEditingController();
    otp3Controller = TextEditingController();
    otp4Controller = TextEditingController();
    backgroundButton = const Color(0XFFEBE9F2);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    // _focusNode.dispose();
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
              Icons.arrow_back_ios,
              color: AppColors.colorPurpleInLogin,
            )),
        title: Text(
          context.localizations.verificationCodeText1,
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
                      context.localizations.verificationCodeText2,
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtilNew.height(8),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Text(
                      "${context.localizations.verificationCodeText3} ",
                      style: GoogleFonts.cairo(
                          color: AppColors.colorResidential,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtilNew.height(24),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VerificationCodeTextField(
                          enabled: otp1Enabled,
                          // focusNode: _focusNode,
                          textEditingController: otp1Controller,
                          onChanged: (value) {
                            setState(() {
                              checkFill();
                            });
                            if (value.length == 1) {
                              setState(() {
                                otp2Enabled = true; // Move to next field
                              });
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                FocusScope.of(context).nextFocus();
                              });
                            }
                          },
                          widthTextFiled: ScreenUtilNew.width(50),
                        ),
                        VerificationCodeTextField(
                          // focusNode: _focusNode,
                          enabled: otp2Enabled,
                          textEditingController: otp2Controller,
                          onChanged: (value) {
                            setState(() {
                              checkFill();
                            });
                            if (value.length == 1) {
                              setState(() {
                                otp3Enabled = true; // Move to next field
                              });
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                FocusScope.of(context).nextFocus();
                              });
                            }
                          },
                          widthTextFiled: ScreenUtilNew.width(50),
                        ),
                        VerificationCodeTextField(
                          // focusNode: _focusNode,
                          enabled: otp3Enabled,
                          textEditingController: otp3Controller,
                          onChanged: (value) {
                            setState(() {
                              checkFill();
                            });
                            if (value.length == 1) {
                              setState(() {
                                otp4Enabled = true; // Move to next field
                              });
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                FocusScope.of(context).nextFocus();
                              });
                            }
                          },
                          widthTextFiled: ScreenUtilNew.width(50),
                        ),
                        VerificationCodeTextField(
                          // focusNode: _focusNode,
                          enabled: otp4Enabled,
                          textEditingController: otp4Controller,
                          onChanged: (value) {
                            setState(() {
                              checkFill();
                            });
                          },
                          widthTextFiled: ScreenUtilNew.width(50),
                        ),
                      ],
                    ),
                  ),
                  InestedOfAccounts(
                    onPressed: () {},
                    textButton: context.localizations.verificationCodeText5,
                    textWithTextButton: context.localizations.verificationCodeText4,
                  ),
                  SizedBox(
                    height: ScreenUtilNew.height(32),
                  ),
                  CustomButton(
                    onPressed: () {
                      if (backgroundButton == AppColors.colorPurpleInLogin) {
                        // _focusNode.unfocus();
                        Navigator.of(context).push(
                          PageAnimationTransition(
                            page: const NewPasswordScreen(),
                            pageAnimationType: LeftToRightTransition(),
                          ),
                        );
                      } else {
                        context.showSnackBar(
                            message: "", erorr: true);
                      }
                    },
                    text: context.localizations.verificationCodeText6,
                    backgroundColor: backgroundButton,
                    padding: ScreenUtilNew.height(16),
                  ),
                    
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Color checkFill() {
    if (otp1Controller.text.isNotEmpty &&
        otp2Controller.text.isNotEmpty &&
        otp3Controller.text.isNotEmpty &&
        otp4Controller.text.isNotEmpty) {
      setState(() {
        backgroundButton = AppColors.colorPurpleInLogin;
      });
      return AppColors.colorPurpleInLogin;
    } else {
      setState(() {
        backgroundButton = AppColors.colorPurpleInLogin;
      });
      backgroundButton = const Color(0XFFEBE9F2);
      return const Color(0XFFEBE9F2);
    }
  }
}
