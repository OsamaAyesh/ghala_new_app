import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/manager/providers/terms_and_condition_controller.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          context.localizations.termsAndConditionScreenText1,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            color: AppColors.colorPurpleInLogin,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.colorPurpleInLogin,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageBackground(),
            Column(
              children: [
                SizedBox(height: ScreenUtilNew.height(16)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: Text(
                    context.localizations.termsAndConditionScreenText2,
                    style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF4B4B4B),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          minimumSize: Size(ScreenUtilNew.width(160),
                              ScreenUtilNew.height(52)),
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          context.localizations.termsAndConditionScreenText4,
                          style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Consumer<TermsAndConditionController>(builder: (context, controller, child) {
                        return ElevatedButton(
                          onPressed: () {
                            controller.isAccepted=true;
                            Navigator.pop(context);
                            // Navigator.pushReplacementNamed(context, "/sign_up_screen");
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            minimumSize: Size(ScreenUtilNew.width(160),
                                ScreenUtilNew.height(52)),
                            backgroundColor: AppColors.colorPurpleInLogin,
                          ),
                          child: Text(
                            context.localizations.termsAndConditionScreenText3,
                            style: GoogleFonts.cairo(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }),

                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(32),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
