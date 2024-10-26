import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';

import '../../../../core/utils/screen_util_new.dart';

class PackageLoginMethods extends StatelessWidget {
  void Function()? onTapFacebook;
  void Function()? onTapPhone;
  void Function()? onTapGmail;
  void Function()? onTapApple;

  PackageLoginMethods(
      {super.key,
      required this.onTapFacebook,
      required this.onTapPhone,
      required this.onTapGmail,
      required this.onTapApple});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: onTapApple,
          child: Container(
            height: ScreenUtilNew.height(60),
            width: ScreenUtilNew.width(60),
            decoration: BoxDecoration(
                color: const Color(0XFFEBE9F2),
                borderRadius: BorderRadius.circular(20.r)),
            child: Image.asset(
              AssetsManger.appleIcon,
              height: ScreenUtilNew.height(24),
              width: ScreenUtilNew.width(24),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapGmail,
          child: Container(
            height: ScreenUtilNew.height(60),
            width: ScreenUtilNew.width(60),
            decoration: BoxDecoration(
                color: const Color(0XFFEBE9F2),
                borderRadius: BorderRadius.circular(20.r)),
            child: Image.asset(
              AssetsManger.gmailIcon,
              height: ScreenUtilNew.height(24),
              width: ScreenUtilNew.width(24),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapPhone,
          child: Container(
            height: ScreenUtilNew.height(60),
            width: ScreenUtilNew.width(60),
            decoration: BoxDecoration(
                color: const Color(0XFFEBE9F2),
                borderRadius: BorderRadius.circular(20.r)),
            child: Image.asset(
              AssetsManger.phoneIcon,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapFacebook,
          child: Container(
            height: ScreenUtilNew.height(60),
            width: ScreenUtilNew.width(60),
            decoration: BoxDecoration(
                color: const Color(0XFFEBE9F2),
                borderRadius: BorderRadius.circular(20.r)),
            child: Image.asset(
              AssetsManger.facebookIcon,
              height: ScreenUtilNew.height(24),
              width: ScreenUtilNew.width(24),
            ),
          ),
        ),
      ],
    );
  }
}
