import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({super.key});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  late TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    context.localizations.searchPersonsScreenText1,
                    style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 280.w,
                  height: 57.h,
                  child: TextField(
                    controller: _searchController,
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0XFFF4F2F6),
                      hintStyle: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0XFF9E9999),
                      ),
                      hintText: context.localizations.searchPersonsScreenText2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtilNew.height(24),
            ),
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                child: Row(
                  children: [
                    Container(
                      height: ScreenUtilNew.height(48),
                      width: ScreenUtilNew.width(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.colorPurpleInLogin),
                    ),
                    SizedBox(width: ScreenUtilNew.width(8),),
                    Text(
                      context.localizations.searchPersonsScreenText3,
                      style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
