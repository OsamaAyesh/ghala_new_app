import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class BestAgenciesSmallContainer extends StatelessWidget {
  String pathImage;
  String title;
  String imageStateFlag;
  String numberOfRegister;
   BestAgenciesSmallContainer({super.key,required this.pathImage,required this.imageStateFlag,required this.title,required this.numberOfRegister});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Container(
        height: ScreenUtilNew.height(107),
        width: ScreenUtilNew.width(112),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              color: AppColors.colorPurpleSecondary,
              offset: Offset(0, 2),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  pathImage,
                  height:  ScreenUtilNew.height(107),
                  width: ScreenUtilNew.width(112),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtilNew.width(8), top: ScreenUtilNew.height(16),right: ScreenUtilNew.width(8)),
                  child: Container(
                    height: ScreenUtilNew.height(19),
                    width: ScreenUtilNew.width(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.r),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.group,
                          color: AppColors.colorPurpleSecondary,
                          size: 8,
                        ),
                        Text(
                          numberOfRegister,
                          style: GoogleFonts.cairo(
                            color: AppColors.colorPurpleSecondary,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(4),vertical: ScreenUtilNew.height(4)),
                        height: ScreenUtilNew.height(19),
                        width: ScreenUtilNew.width(19),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                        child: Image.asset(
                          imageStateFlag,
                          height: ScreenUtilNew.height(11),
                          width: ScreenUtilNew.width(11),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(11)
                )
              ],
            )
          ],
        ));
  }
}
