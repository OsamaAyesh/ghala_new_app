import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/screen_util_new.dart';
class ColumnOnBoardingScreenWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color colorText;
  const ColumnOnBoardingScreenWidget({super.key,required this.title,required this.subTitle,required this.colorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: colorText,
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          maxLines: 1,
        ),
        SizedBox(height: ScreenUtilNew.height(6),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(24)),
          child: Text(
            subTitle,
            style: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0XFF5F5F5F),
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
