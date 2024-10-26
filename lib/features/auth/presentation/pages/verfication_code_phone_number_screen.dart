import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/verification_code_text_field.dart';
import 'login_screen.dart';

class VerficationCodePhoneNumberScreen extends StatefulWidget {
  late String phoneNumber;

  VerficationCodePhoneNumberScreen({super.key, required this.phoneNumber});

  @override
  State<VerficationCodePhoneNumberScreen> createState() =>
      _VerficationCodePhoneNumberScreenState();
}

class _VerficationCodePhoneNumberScreenState
    extends State<VerficationCodePhoneNumberScreen> {
  late TextEditingController otp1Controller;
  late TextEditingController otp2Controller;
  late TextEditingController otp3Controller;
  late TextEditingController otp4Controller;
  late TextEditingController otp5Controller;
  late TextEditingController otp6Controller;
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
    otp5Controller = TextEditingController();
    otp6Controller = TextEditingController();
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
    otp5Controller.dispose();
    otp6Controller.dispose();
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
        context.localizations.phoneNumberVerficationScreenText1,
        style: GoogleFonts.cairo(
          fontSize: 20.sp,
          color: AppColors.colorPurpleInLogin,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.colorPurpleInLogin,
        ),
      ),
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
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Text(
                      context.localizations.phoneNumberVerficationScreenText2,
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp),
                    ),
                  ),
                  SizedBox(
                    height:ScreenUtilNew.height(8),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Text(
                      "${context.localizations.phoneNumberVerficationScreenText3} ${widget.phoneNumber}+",
                      style: GoogleFonts.cairo(
                          color: AppColors.colorResidential,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),

                    ),
                  ),
                  SizedBox(
                    height: ScreenUtilNew.width(32)
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerificationCodeTextField(
                            enabled: otp1Enabled,
                            textEditingController: otp1Controller,
                            onChanged: (value) {
                              setState(() {
                                checkFill();
                              });
                              if (value.length == 1) {
                                setState(() {
                                  otp2Enabled = true; // Move to next field
                                });
                                Future.delayed(const Duration(milliseconds: 100), () {
                                  FocusScope.of(context).nextFocus();
                                });
                              }

                            },
                            widthTextFiled: 47.w,
                          ),

                          VerificationCodeTextField(
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
                                Future.delayed(Duration(milliseconds: 100), () {
                                  FocusScope.of(context).nextFocus();
                                });

                              }
                            },
                            widthTextFiled: 47.w,
                          ),

                          VerificationCodeTextField(
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
                                Future.delayed(Duration(milliseconds: 100), () {
                                  FocusScope.of(context).nextFocus();
                                });

                              }
                            },
                            widthTextFiled: 47.w,
                          ),

                          VerificationCodeTextField(
                            enabled: otp4Enabled,
                            textEditingController: otp4Controller,
                            onChanged: (value) {
                              setState(() {
                                checkFill();
                              });
                              if (value.length == 1) {
                                setState(() {
                                  otp5Enabled = true; // Move to next field
                                });
                                Future.delayed(Duration(milliseconds: 100), () {
                                  FocusScope.of(context).nextFocus();
                                });

                              }
                            },
                            widthTextFiled: 47.w,
                          ),

                          VerificationCodeTextField(
                            enabled: otp5Enabled,
                            textEditingController: otp5Controller,
                            onChanged: (value) {
                              setState(() {
                                checkFill();
                              });
                              if (value.length == 1) {
                                setState(() {
                                  otp6Enabled = true; // Move to next field
                                });
                                Future.delayed(Duration(milliseconds: 100), () {
                                  FocusScope.of(context).nextFocus();
                                });

                              }
                            },
                            widthTextFiled: 47.w,
                          ),

                          VerificationCodeTextField(
                            enabled: otp6Enabled,
                            textEditingController: otp6Controller,
                            onChanged: (value) {
                              setState(() {
                                checkFill();
                              });
                            },
                            widthTextFiled: 47.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:  ScreenUtilNew.height(48),),
                  CustomButton(
                      onPressed: () {
                        _checkData();
                      },
                      text: context.localizations.phoneNumberVerficationScreenText4,
                      backgroundColor: backgroundButton,
                  padding: ScreenUtilNew.width(16),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color checkFill() {
    if (otp1Controller.text.isNotEmpty &&
        otp2Controller.text.isNotEmpty &&
        otp3Controller.text.isNotEmpty &&
        otp4Controller.text.isNotEmpty &&
        otp5Controller.text.isNotEmpty &&
        otp6Controller.text.isNotEmpty) {
      setState(() {
        backgroundButton=AppColors.colorPurpleInLogin;
      });
      return AppColors.colorPurpleInLogin;
    } else {
      setState(() {
        backgroundButton=AppColors.colorPurpleInLogin;
      });
      backgroundButton=Color(0XFFEBE9F2);
      return Color(0XFFEBE9F2);
    }
  }
// void _settingModalBottomSheet(context) {
//   bool isDisable = false;
//   showModalBottomSheet(
//     context: context,
//     isDismissible: false,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50.r),
//           topRight: Radius.circular(50.r)),
//     ),
//     builder: (BuildContext bc) {
//       return SizedBox(
//         height: 400.h,
//         width: 375.w,
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       AssetsManger.successImage,
//                       height: 180.h,
//                       width: 180.w,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Text(
//                     "تمت العملية بنجاح",
//                     style: GoogleFonts.cairo(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.bold,
//                       color: const Color(0XFF00CB39),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 79.w),
//                     child: Text(
//                       "لقد قمت بالتسجيل عن  طريق رقم الهاتف",
//                       style: GoogleFonts.cairo(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w500,
//                           color: const Color(0XFF9C9C9C)),
//                       textAlign: TextAlign.center,
//                       textDirection: TextDirection.rtl,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 40.h,
//                   ),
//                   CustomButton(
//                     onPressed: () {
//                       Navigator.of(context).push(PageAnimationTransition(
//                           page:  LoginScreen(),
//                           pageAnimationType: BottomToTopTransition()));
//                     },
//                     text: "الانتقال إلى تسجيل الدخول",
//                     backgroundColor: const Color(0XFF00CB39),
//                     padding: 24.w,
//                   ),
//                   // Align(
//                   //   alignment: Alignment.topCenter,
//                   //   child: ElevatedButton(
//                   //     style: ElevatedButton.styleFrom(
//                   //       minimumSize: Size(314.w, 50.h),
//                   //       backgroundColor: const Color(0XFF26AD71),
//                   //       shadowColor: Colors.transparent,
//                   //       shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(30.r),
//                   //       ),
//                   //     ),
//                   //     onPressed: () {
//                   //       Navigator.pop(context);
//                   //     },
//                   //     child: const Text("Browse Home"),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
// void _cancelModalBottomSheet(context) {
//   bool isDisable = false;
//   showModalBottomSheet(
//     context: context,
//     isDismissible: false,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(50.r),
//           topRight: Radius.circular(50.r)),
//     ),
//     builder: (BuildContext bc) {
//       return SizedBox(
//         height: 400.h,
//         width: 375.w,
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 4.h,),
//                     Align(
//                       alignment: Alignment.center,
//                       child: Image.asset(
//                         "assets/images/new_password_screen/cancle.gif",
//                         height: 180.h,
//                         width: 180.w,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     Text(
//                       "خطأ في إنشاء حساب جديد",
//                       style: GoogleFonts.cairo(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0XFFFF0000),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 79.w),
//                       child: Text(
//                         "لقد حصل خطأ أثناء إنشاء  حساب جديد",
//                         style: GoogleFonts.cairo(
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.w500,
//                             color: const Color(0XFF9C9C9C)),
//                         textAlign: TextAlign.center,
//                         textDirection: TextDirection.rtl,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40.h,
//                     ),
//                     CustomButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       text: "إلغاء",
//                       backgroundColor: const Color(0XFFFF0000),
//                       padding: 24.w,
//                     ),
//                     // Align(
//                     //   alignment: Alignment.topCenter,
//                     //   child: ElevatedButton(
//                     //     style: ElevatedButton.styleFrom(
//                     //       minimumSize: Size(314.w, 50.h),
//                     //       backgroundColor: const Color(0XFF26AD71),
//                     //       shadowColor: Colors.transparent,
//                     //       shape: RoundedRectangleBorder(
//                     //         borderRadius: BorderRadius.circular(30.r),
//                     //       ),
//                     //     ),
//                     //     onPressed: () {
//                     //       Navigator.pop(context);
//                     //     },
//                     //     child: const Text("Browse Home"),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
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
                  bc.localizations.phoneNumberVerficationScreenText5,
                  style: GoogleFonts.cairo(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0XFF00CB39),
                  ),
                ),
                SizedBox(height: ScreenUtilNew.height(16)),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(32)),
                  child: Text(
                    bc.localizations.phoneNumberVerficationScreenText6,
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
                      Navigator.pushReplacementNamed(context, Routes.loginScreen);
                    },
                    text: bc.localizations.signUPScreenText13,
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
                  AppStrings.cancelString1NewPassword,
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
                    AppStrings.cancelString2NewPassword,
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
  if (backgroundButton==AppColors.colorPurpleInLogin) {
    // ignore: use_build_context_synchronously
    _settingModalBottomSheet(context);

  }else{
    context.showSnackBar(message: "يجب إدخال البيانات في جميع حقول النص",erorr: true);
  }
  // ignore: use_build_context_synchronously
}
}
