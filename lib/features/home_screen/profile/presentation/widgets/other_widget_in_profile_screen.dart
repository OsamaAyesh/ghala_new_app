import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class OtherWidgetInProfileScreen extends StatelessWidget {
  final String pathImage;
  final String text;
  void Function()? onTap;
  double width;
   OtherWidgetInProfileScreen({super.key,required this.pathImage,required this.text,required this.onTap,required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              pathImage,
              height: ScreenUtilNew.height(32),
              width: ScreenUtilNew.width(32),
              fit: BoxFit.contain,
            ),
            Text(
              text,
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.colorPurpleInLogin,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
