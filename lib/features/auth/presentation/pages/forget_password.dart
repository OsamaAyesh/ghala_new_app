import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/verification_code_email_screen.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manger.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_field_auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailTextEditingController;
  Color backgroundButton=const Color(0XFFEBE9F2);

  @override
  void initState() {
    // TODO: implement initState
    emailTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailTextEditingController.dispose();
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
          context.localizations.forgetPasswordText1,
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
            Icons.arrow_back_ios,
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
                    padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left: ScreenUtilNew.width(16)),
                    child: Text(
                      context.localizations.forgetPasswordText2,
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
                    padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left: ScreenUtilNew.width(16),),
                    child: Text(
                      context.localizations.forgetPasswordText3,
                      style: GoogleFonts.cairo(
                          color: AppColors.colorResidential,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(
                    height:ScreenUtilNew.height(24),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left: ScreenUtilNew.width(16)),
                    child: Text(
                      context.localizations.forgetPasswordText4,
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
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: TextFieldAuth(
                      onChanged: (value){
                        _checkFilled();
                      },
                      hintText: AppStrings.forgetPassword5,
                      suffixIcon: Icons.lock_outline_sharp,
                      textEditingController: emailTextEditingController,
                      obscureText: false,
                      prefixIcon: false,
                      suffixIconColor: AppColors.colorPurpleInLogin, nameValidator: (String? value) {  },
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtilNew.height(32)
                  ),
                  CustomButton(
                    onPressed: () {
                      if(emailTextEditingController.text.isNotEmpty){
                        Navigator.of(context).push(PageAnimationTransition(
                            page:  VerificationCodeEmailScreen(email:emailTextEditingController.text ,),
                            pageAnimationType: LeftToRightTransition()));
                      }else{
                        context.showSnackBar(message: "",erorr: true);
                      }
                    },
                    text: context.localizations.forgetPasswordText5,
                    backgroundColor:backgroundButton,
                    padding: ScreenUtilNew.width(16),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
  Color _checkFilled(){
    if(emailTextEditingController.text.isNotEmpty){
      setState(() {
        backgroundButton = AppColors.colorPurpleInLogin;
      });
    }else{
      setState(() {
        backgroundButton = const Color(0XFFEBE9F2);

      });
    }
    return const Color(0XFFEBE9F2);
  }
}
// body: SafeArea(
//   child: Column(
//     children: [
//       SizedBox(
//         height:235.h,
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: ListView.builder(
//             physics: const BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             itemCount: 20,
//             itemBuilder: (context, index) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: ScreenUtilNew.width(16),
//                   ),
//                   Padding(
//                     //هنا للتعديل ممكن تحطي بدل ال 19 وهو الرقم القبل الاخير بسبب انو كيون مناسب يعني لما يكون عندي apiبحط انو length-1هذا الكلام الي بحكيه عن 19 الي انا حاططها
//                     padding: EdgeInsets.only(
//                         left: index == 19 ? ScreenUtilNew.width(16) : 0),
//                     child: Container(
//                       height:219.h,
//                       width: 324.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.r),
//                         color:Colors.white,
//                         boxShadow:  [
//                           BoxShadow(
//                             blurRadius: 14,
//                             blurStyle: BlurStyle.normal,
//                             color: Colors.black.withOpacity(0.25),
//                             offset: Offset(0, 5),
//                             // لتعديل مكان الظل ليكون محددًا
//                             spreadRadius: 2
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//
//                         ],
//                       )
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//       Text("data")
//     ],
//   ),
// ),