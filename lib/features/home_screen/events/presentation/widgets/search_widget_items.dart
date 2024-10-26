import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets_manger.dart';
import '../../../../../core/utils/screen_util_new.dart';

class SearchWidgetItems extends StatelessWidget {
  String imagePath;
  String title;

  SearchWidgetItems({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenUtilNew.height(78),
          width: ScreenUtilNew.width(78),
          decoration:
              const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: ScreenUtilNew.height(8),
        ),
        Text(
          title,
          style: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        )
      ],
    );
  }
}
