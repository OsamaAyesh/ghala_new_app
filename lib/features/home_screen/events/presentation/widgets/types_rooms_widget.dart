import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../auth/presentation/widgets/gradient_text.dart';


class TypesRoomsWidget extends StatelessWidget {
  String imagePath;
  String nameTypeRoom;
  double width;
  double height;
  final Gradient gradient;

  TypesRoomsWidget(
      {super.key,
      required this.imagePath,
      required this.nameTypeRoom,
      required this.height,
      required this.width,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenUtilNew.height(100),
          width: ScreenUtilNew.width(100),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(8),vertical: ScreenUtilNew.width(8)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradient,
          ),
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
        ),
        GradientText(
          text: nameTypeRoom,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          gradient: gradient,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }
}
