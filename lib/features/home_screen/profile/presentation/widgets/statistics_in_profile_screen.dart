import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsInProfileScreen extends StatelessWidget {
  final String numberStatistic;
  final String nameStatistic;
  const StatisticsInProfileScreen({super.key,required this.numberStatistic,required this.nameStatistic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          numberStatistic,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
        Text(
          nameStatistic,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
