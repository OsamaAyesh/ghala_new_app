import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class TextFieldInContactUs extends StatelessWidget {
  String hintText;
  TextEditingController textEditingController;
  double widthTextField;
  int minLines;
  int maxLines;

   TextFieldInContactUs({super.key,required this.hintText,required this.textEditingController,required this.widthTextField,required this.minLines,required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthTextField,
      child: TextField(
        minLines: minLines,
        maxLines: maxLines,
        controller: textEditingController,
        style: GoogleFonts.cairo(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                  color: AppColors.colorPurpleInLogin,
                  width: 1
              )
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0XFF838383)
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.colorPurpleInLogin,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: Colors.transparent,

        ),
      ),
    );
  }
}
