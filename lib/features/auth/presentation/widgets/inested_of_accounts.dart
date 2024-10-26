import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
class InestedOfAccounts extends StatelessWidget {
  void Function()? onPressed;
  final String textButton;
  final String textWithTextButton;

   InestedOfAccounts({super.key,required this.onPressed,required this.textButton,required this.textWithTextButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textWithTextButton,
          style: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.colorResidential),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: GoogleFonts.cairo(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.colorPurpleInLogin),
          ),
        ),
      ],
    );
  }
}
