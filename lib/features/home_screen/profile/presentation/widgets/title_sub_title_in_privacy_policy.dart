import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/screen_util_new.dart';


class TitleSubTitleInPrivacyPolicy extends StatelessWidget {
  final String title;
  final String subTitle;
  const TitleSubTitleInPrivacyPolicy({super.key,required this.title,required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: ScreenUtilNew.width(16)),
          child: Text(
            title,
            style: GoogleFonts.cairo(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF4B4B4B),
            ),
          ),
        ),
        SizedBox(
          height:ScreenUtilNew.height(8)
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: Text(
            subTitle,
            style: GoogleFonts.cairo(
              color: AppColors.colorResidential,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
