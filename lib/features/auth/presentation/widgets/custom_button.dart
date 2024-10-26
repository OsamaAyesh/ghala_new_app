import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/screen_util_new.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  double padding;
   CustomButton({super.key,required this.onPressed,required this.text,required this.backgroundColor,required this.padding});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          height:  ScreenUtilNew.height(60),
          width: double.infinity,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15.r)),
          child: Stack(
            children: [
              Center(
                  child: Image.asset(
                      AssetsManger.backgroundCustomButton)),
              Center(
                child: Text(
                  text,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
