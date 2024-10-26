import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class CenterGames extends StatelessWidget {
  const CenterGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: ScreenUtilNew.height(16),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
            child: Container(
              height: ScreenUtilNew.height(80),
              width: double.infinity,
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.colorPurpleInLogin.withOpacity(0.25),
                    offset: const Offset(0, 2),
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 3,
                    blurRadius: 10
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("L V .07",style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),),
                    const Expanded(child: SizedBox()),
                    Text("أسامة محمد علي",style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),),
                    SizedBox(width: ScreenUtilNew.width(8),),
                    CircleAvatar(
                      backgroundColor: AppColors.colorPurpleInLogin,
                      radius: ScreenUtilNew.height(30),
                      backgroundImage: const AssetImage(AssetsManger.bestAgency2),
                    )
                    // Container(
                    //   height: 52.h,
                    //   width: 52.w,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: AppColors.colorPurpleInLogin,
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.black.withOpacity(0.25),
                    //       offset: Offset(0, 2),
                    //       blurRadius: 20,
                    //       blurStyle: BlurStyle.normal
                    //
                    //     )
                    //   ]),
                    //   child: Image.asset(
                    //     "assets/images/home_screen_images/profile_photo.png",
                    //     height: 52.h,
                    //     width: 52.w,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    // SizedBox(width: 16.w,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
