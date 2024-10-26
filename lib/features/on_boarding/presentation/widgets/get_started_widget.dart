import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/screen_util_new.dart';
class GetStartedWidget extends StatelessWidget {
  const GetStartedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0XFF72B3C0),
          ),
          width: double.infinity,
          height: ScreenUtilNew.height(52),
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: Text(
              context.localizations.onboarding3text3,
              style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
