import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';

import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/pages/permission_screen.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/pages/privacy_policy.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/pages/settings_screen.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/pages/test_internet_screen.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/pages/wallet_screen.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/widgets/wallet_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manger.dart';
import '../widgets/other_widget_in_profile_screen.dart';
import '../widgets/statistics_in_profile_screen.dart';
import 'contact_us_screen.dart';
import 'followers_screen.dart';
import 'language_screen.dart';
import 'level_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration:
                  const BoxDecoration(color: AppColors.colorPurpleInLogin),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      AssetsManger.backGroundImageProfile,
                      height: ScreenUtilNew.height(156),
                      width: ScreenUtilNew.width(135),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: ScreenUtilNew.height(56),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "محمد علي إسماعيل",
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.copy,
                                        color: Colors.white,
                                        size: 16,
                                      )),
                                  Text(
                                    "id:44442123232",
                                    style: GoogleFonts.cairo(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Text(
                                  "LV.07",
                                  style: GoogleFonts.cairo(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.colorPurpleInLogin,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(8),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: ScreenUtilNew.height(40),
                            backgroundImage:
                                const AssetImage(AssetsManger.bestAgency1),
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(24),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtilNew.height(24),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: const FollowersScreen(),
                              pageAnimationType: BottomToTopTransition()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            StatisticsInProfileScreen(
                              nameStatistic:
                                  context.localizations.profileScreenText3,
                              numberStatistic: "232",
                            ),
                            Image.asset(AssetsManger.dividerProfileScreen,
                                fit: BoxFit.contain),
                            StatisticsInProfileScreen(
                              nameStatistic:
                                  context.localizations.profileScreenText2,
                              numberStatistic: "232",
                            ),
                            Image.asset(AssetsManger.dividerProfileScreen,
                                fit: BoxFit.contain),
                            StatisticsInProfileScreen(
                              nameStatistic:
                                  context.localizations.profileScreenText1,
                              numberStatistic: "232",
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtilNew.height(16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(16),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 2),
                      blurRadius: 20,
                      blurStyle: BlurStyle.normal,
                      // spreadRadius: 20.r
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: ScreenUtilNew.width(16), top: 16.h,left:ScreenUtilNew.width(16) ),
                      child: Text(
                        context.localizations.profileScreenText4,
                        style: GoogleFonts.cairo(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(12),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageAnimationTransition(
                            page: const WalletScreen(),
                            pageAnimationType: BottomToTopTransition()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: ScreenUtilNew.width(16),
                          ),
                          WalletTypes(
                            colorBalanceWallet: Colors.black,
                            pathImage: AssetsManger.goldMoney,
                            balanceWallet: " 25 ${context.localizations.profileScreenText6}",
                            linearGradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0XFF000000),
                                Color(0XFF000000),
                                Colors.white,
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          WalletTypes(
                            colorBalanceWallet: const Color(0XFF05ACF0),
                            pathImage: AssetsManger.dimondMoney,
                            balanceWallet: " 25${context.localizations.profileScreenText5} ",
                            linearGradient: const LinearGradient(
                              colors: [
                                Color(0XFFA5E9FF),
                                Color(0XFF00AAF0),
                              ],
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     // Navigator.of(context).push(PageAnimationTransition(
                          //     //     page:   const WalletScreen(),
                          //     //     pageAnimationType: BottomToTopTransition()));
                          //   },
                          //   child: Container(
                          //     height: 64.h,
                          //     width: ScreenUtilNew.width(146),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.r),
                          //       gradient: const LinearGradient(
                          //         colors: [
                          //           Color(0XFFA5E9FF),
                          //           Color(0XFF00AAF0),
                          //         ],
                          //       ),
                          //     ),
                          //     child: Stack(
                          //       children: [
                          //         Align(
                          //           alignment: Alignment.bottomRight,
                          //           child: Image.asset(
                          //             "assets/images/home_screen_images/wallet_dimond_background.png",
                          //             height: 34.h,
                          //             fit: BoxFit.contain,
                          //           ),
                          //         ),
                          //         Padding(
                          //           padding:
                          //               EdgeInsets.only(right: 4.w, bottom: 4.h),
                          //           child: Align(
                          //               alignment: Alignment.bottomRight,
                          //               child: Image.asset(
                          //                   "assets/images/home_screen_images/dimond_image.png")),
                          //         ),
                          //         Align(
                          //           alignment: Alignment.centerLeft,
                          //           child: Container(
                          //             height: 20.h,
                          //             width: 83.w,
                          //             decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 borderRadius: BorderRadius.only(
                          //                   bottomRight: Radius.circular(20.r),
                          //                   topRight: Radius.circular(20.r),
                          //                 )),
                          //             child: Align(
                          //               alignment: Alignment.center,
                          //               child: Text(
                          //                 "45 جوهرة",
                          //                 style: GoogleFonts.cairo(
                          //                     fontWeight: FontWeight.w500,
                          //                     fontSize: 12.sp,
                          //                     color: const Color(0XFF05ACF0)),
                          //               ),
                          //             ),
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: ScreenUtilNew.width(16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(16),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(16),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Container(
                // height: 246.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(0, 2),
                        blurRadius: 20,
                        blurStyle: BlurStyle.normal,
                        // spreadRadius: 20.r
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.w, top: 16.h,left: 16.w),
                      child: Text(
                        context.localizations.profileScreenText7,
                        style: GoogleFonts.cairo(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtilNew.width(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OtherWidgetInProfileScreen(
                                width: ScreenUtilNew.width(80),
                                pathImage: AssetsManger.crownIcon,
                                text: context.localizations.profileScreenText8,
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: const LevelScreen(),
                                          pageAnimationType:
                                          BottomToTopTransition()));
                                },
                              ),
                              OtherWidgetInProfileScreen(
                                width: ScreenUtilNew.width(80),
                                pathImage: AssetsManger.languagesIcon,
                                text: context.localizations.profileScreenText9,
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: LanguageScreen(),
                                          pageAnimationType:
                                              BottomToTopTransition()));
                                },
                              ),
                              OtherWidgetInProfileScreen(
                                  width: ScreenUtilNew.width(80),
                                  pathImage: AssetsManger.crownIcon,
                                  text: context.localizations.profileScreenText10,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        PageAnimationTransition(
                                            page: const ContactUsScreen(),
                                            pageAnimationType:
                                            BottomToTopTransition()));
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtilNew.height(16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtilNew.width(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OtherWidgetInProfileScreen(
                                width: ScreenUtilNew.width(80),
                                pathImage: AssetsManger.settingsIcon,
                                text: context.localizations.profileScreenText11,
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: const SettingsScreen(),
                                          pageAnimationType:
                                          BottomToTopTransition()));
                                },
                              ),
                              OtherWidgetInProfileScreen(
                                width: ScreenUtilNew.width(80),
                                pathImage: AssetsManger.privacyIcon,
                                text: context.localizations.profileScreenText12,
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: const PrivacyPolicy(),
                                          pageAnimationType:
                                          BottomToTopTransition()));
                                },
                              ),
                              OtherWidgetInProfileScreen(
                                width: ScreenUtilNew.width(80),
                                pathImage: AssetsManger.userSettingsIcon,
                                text: context.localizations.profileScreenText12,
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: const PermissionScreen(),
                                          pageAnimationType:
                                              BottomToTopTransition()));
                                },
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtilNew.height(16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtilNew.width(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OtherWidgetInProfileScreen(
                                width: ScreenUtilNew.width(80),
                                pathImage: AssetsManger.testInternetIcon,
                                text: context.localizations.profileScreenText14,
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: const TestInternetScreen(),
                                          pageAnimationType:
                                          BottomToTopTransition()));
                                },
                              ),
                              OtherWidgetInProfileScreen(
                                width: ScreenUtilNew.width(80),
                                pathImage: AssetsManger.logoutIcon,
                                text: context.localizations.profileScreenText15,
                                onTap: () {},
                              ),
                              SizedBox(
                                width: ScreenUtilNew.width(80),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtilNew.height(16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(120),
            ),
          ],
        ),
      ),
    );
  }
}
