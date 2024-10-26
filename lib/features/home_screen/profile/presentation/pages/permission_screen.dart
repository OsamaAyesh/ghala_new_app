import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_forward_ios_sharp,color: AppColors.colorPurpleInLogin,))],
        title: Text(
          AppStrings.permissionScreen1,
          style: GoogleFonts.cairo(
              fontSize: 16.sp,
              color: AppColors.colorPurpleInLogin,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(),
    );
  }
}
