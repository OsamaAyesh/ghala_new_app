import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/screen_util_new.dart';
class ChatRoomsBottomTheCountries extends StatelessWidget {
  String imagePath;
  String flagPath;
  String title;
   ChatRoomsBottomTheCountries({super.key,required this.imagePath,required this.flagPath,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtilNew.height(136),
        width: ScreenUtilNew.width(155),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              color: AppColors.colorPurpleSecondary,
              offset: Offset(0, 2),
              // لتعديل مكان الظل ليكون محددًا
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                // إضافة حواف مستديرة للصورة
                child: Image.asset(
                  AssetsManger.bestAgency1,
                  height: ScreenUtilNew.height(222),
                  width: ScreenUtilNew.width(213),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left:ScreenUtilNew.width(16), top: ScreenUtilNew.height(16)),
                    child: Container(
                      height: ScreenUtilNew.height(24),
                      width: ScreenUtilNew.width(48),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19.r),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.group,
                            color: AppColors.colorPurpleSecondary,
                            size: 16,
                          ),
                          Text(
                            "23",
                            style: GoogleFonts.cairo(
                              color: AppColors.colorPurpleSecondary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(4),vertical: ScreenUtilNew.height(4)),
                        height:ScreenUtilNew.height(20),
                        width: ScreenUtilNew.width(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Image.asset(
                          flagPath,
                          height:ScreenUtilNew.height(16),
                          width: ScreenUtilNew.width(16),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        title,
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(16),
                )
              ],
            )
          ],
        ));
  }
}
