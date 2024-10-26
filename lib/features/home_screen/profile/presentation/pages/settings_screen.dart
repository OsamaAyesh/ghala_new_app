import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/app_strings.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        centerTitle: true,
        title: Text(
          context.localizations.settingsScreenText1,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
      ),
      body: Stack(
        children: [

        ],
      ),
    );
  }
}
