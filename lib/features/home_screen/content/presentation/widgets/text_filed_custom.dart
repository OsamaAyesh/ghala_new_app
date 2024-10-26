import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';


class TextFiledCustom extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  int minLines;
  int maxLines;

  TextFiledCustom(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.maxLines,
      required this.minLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: TextField(
        controller: textEditingController,
        minLines: minLines,
        maxLines: maxLines,
        style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            color: AppColors.colorPurpleInLogin),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(14), vertical: ScreenUtilNew.height(8)),
          hintText: hintText,
          hintStyle: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: const Color(0XFFA89E9E)),
          filled: true,
          fillColor: const Color(0XFFEBE6FF),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
