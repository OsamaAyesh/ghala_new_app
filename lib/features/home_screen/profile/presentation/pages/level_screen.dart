import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.forward(); // يبدأ الأنيميشن مباشرة
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AssetsManger.levelImage,
              height: ScreenUtilNew.height(305),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtilNew.height(280)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtilNew.width(16)),
                      child: Container(
                          height: ScreenUtilNew.height(600),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 3),
                                  spreadRadius: 20,
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 20)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: ScreenUtilNew.height(24),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "LV.01",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: AppColors.colorPurpleInLogin,
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenUtilNew.height(20),
                                    width: width * 0.645333333,
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10.r),
                                      value: 0.5,
                                      // تعيين القيمة الثابتة لمؤشر التحميل
                                      // semanticsLabel: 'Linear progress indicator',
                                      color: const Color(0XFF8381DC),
                                      backgroundColor: Colors.grey[200],
                                      // لون الخلفية لمؤشر التحميل
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0XFF8381DC),
                                      ), // لون المؤشر
                                    ),
                                  ),
                                  Text(
                                    "LV.02",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: AppColors.colorPurpleInLogin,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(24),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left: ScreenUtilNew.width(16)),
                      child: Text(
                        context.localizations.levelScreenText1,
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorPurpleInLogin),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtilNew.width(16)),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          context.localizations.levelScreenText2,
                          style: GoogleFonts.cairo(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF888787),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(32),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtilNew.height(32),
                  right: ScreenUtilNew.width(16)),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
