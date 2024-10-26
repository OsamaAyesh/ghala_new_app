import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';
class GhalaEventAndTeamContainer extends StatelessWidget {
  String imagePath;
  String title;
  String subTitle;
   GhalaEventAndTeamContainer({super.key,required this.imagePath,required this.title,required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: Container(
        width: double.infinity,
        // height: ScreenUtilNew.height(285),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              spreadRadius: 10.r,
              blurRadius: 100,
              offset: const Offset(
                  0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtilNew.height(16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                    imagePath,
                    height: ScreenUtilNew.height(134),
                    width: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(8),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  title,
                  style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtilNew.width(16)),
              child: Text(
                subTitle,
                style: GoogleFonts.cairo(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFFAEAEAE)),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(16),
            ),
          ],
        ),
      ),
    );
  }
}
