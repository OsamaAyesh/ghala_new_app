import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/app_strings.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          context.localizations.followingScreenText1,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.colorPurpleInLogin,
          dividerColor: Colors.transparent,
          labelColor: AppColors.colorPurpleInLogin,
          labelStyle: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          tabs:  [
            Tab(text: context.localizations.followingScreenText2),
            Tab(text: context.localizations.followingScreenText3),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
      ),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        children: [
          // Content for "يتابعونك" Tab
          ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    index == 0
                        ? SizedBox(
                            height: ScreenUtilNew.height(16),
                          )
                        : SizedBox(
                            height: 0.h,
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Container(
                        height: ScreenUtilNew.height(77),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 2),
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 4,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:ScreenUtilNew.width(16) ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert_outlined),
                              ),
                              Container(
                                height: ScreenUtilNew.height(24),
                                width: ScreenUtilNew.width(72),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Center(
                                  child: Text(
                                    context.localizations.followingScreenText4,
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              // SizedBox(width: 32.w),
                              Text(
                                "علي محمد إسماعيل ",
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: ScreenUtilNew.width(8)),
                              CircleAvatar(
                                backgroundImage: const AssetImage(AssetsManger.bestAgency3),
                                radius: ScreenUtilNew.height(25),
                              ),
                              // SizedBox(
                              //   height: 52.h,
                              //   width: 52.h,
                              //   child: Stack(
                              //     children: [
                              //       Container(
                              //         height: 48.h,
                              //         width: 48.w,
                              //         decoration: const BoxDecoration(
                              //           shape: BoxShape.circle,
                              //         ),
                              //         child: Image.asset(
                              //           "assets/images/home_screen_images/profile_image_num2.png",
                              //           height: 48.h,
                              //           width: 48.w,
                              //           fit: BoxFit.contain,
                              //         ),
                              //       ),
                              //       Align(
                              //         alignment: Alignment.bottomRight,
                              //         child: Padding(
                              //           padding: EdgeInsets.only(
                              //               bottom: 6.h, right: 6.w),
                              //           child: Container(
                              //             height: 8.h,
                              //             width: 8.w,
                              //             decoration: BoxDecoration(
                              //               color: Colors.green,
                              //               shape: BoxShape.circle,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(width: 16.w),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                );
              }),
          // Content for "تتابعهم" Tab
          ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    index == 0
                        ? SizedBox(
                      height: ScreenUtilNew.height(16),
                    )
                        : SizedBox(
                      height: 0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Container(
                        height: ScreenUtilNew.height(77),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 2),
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 4,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal:ScreenUtilNew.width(16) ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert_outlined),
                              ),
                              Container(
                                height: ScreenUtilNew.height(24),
                                width: ScreenUtilNew.width(64),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                child: Center(
                                  child: Text(
                                    context.localizations.followingScreenText5,
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              // SizedBox(width: 32.w),
                              Text(
                                "علي محمد إسماعيل ",
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: ScreenUtilNew.width(8)),
                              CircleAvatar(
                                backgroundImage: const AssetImage(AssetsManger.bestAgency3),
                                radius: ScreenUtilNew.height(25),
                              ),
                              // SizedBox(
                              //   height: 52.h,
                              //   width: 52.h,
                              //   child: Stack(
                              //     children: [
                              //       Container(
                              //         height: 48.h,
                              //         width: 48.w,
                              //         decoration: const BoxDecoration(
                              //           shape: BoxShape.circle,
                              //         ),
                              //         child: Image.asset(
                              //           "assets/images/home_screen_images/profile_image_num2.png",
                              //           height: 48.h,
                              //           width: 48.w,
                              //           fit: BoxFit.contain,
                              //         ),
                              //       ),
                              //       Align(
                              //         alignment: Alignment.bottomRight,
                              //         child: Padding(
                              //           padding: EdgeInsets.only(
                              //               bottom: 6.h, right: 6.w),
                              //           child: Container(
                              //             height: 8.h,
                              //             width: 8.w,
                              //             decoration: BoxDecoration(
                              //               color: Colors.green,
                              //               shape: BoxShape.circle,
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(width: 16.w),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
