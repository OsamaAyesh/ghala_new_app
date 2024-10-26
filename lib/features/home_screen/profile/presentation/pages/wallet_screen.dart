import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/screen_util_new.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with SingleTickerProviderStateMixin{
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(context.localizations.profileScreenText4,style: GoogleFonts.cairo(
          fontSize: 16.sp,
          color: AppColors.colorPurpleInLogin,
          fontWeight: FontWeight.bold
        ),),
        leading:   IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
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
            Tab(text: context.localizations.walletScreenText2),
            Tab(text: context.localizations.walletScreenText1),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              SizedBox(height: ScreenUtilNew.height(16),),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.colorPurpleInLogin,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                            child: Image.asset(AssetsManger.goldMoneyBackgroundInWalletScreen)),
                       Row(
                         children: [
                           SizedBox(width: ScreenUtilNew.width(16),),
                           Image.asset(AssetsManger.goldMoneyInWalletScreen),
                           const Expanded(child: SizedBox()),
                           Column(
                             children: [
                               Padding(
                                 padding: EdgeInsets.only(top: ScreenUtilNew.height(16),right: ScreenUtilNew.width(16)),
                                 child: Align(
                                   alignment: Alignment.centerRight,
                                   child: Text(context.localizations.walletScreenText3,style: GoogleFonts.cairo(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.sp,
                                       color: Colors.white
                                   ),),
                                 ),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(top: ScreenUtilNew.height(16),right: ScreenUtilNew.width(16)),
                                 child: Align(
                                   alignment: Alignment.centerRight,
                                   child: Text("\$ 15.0",style: GoogleFonts.cairo(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 36.sp,
                                       color: Colors.white
                                   ),),
                                 ),
                               ),
                
                             ],
                           ),
                         ],
                       )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(height: ScreenUtilNew.height(16),),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.colorPurpleInLogin,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset(AssetsManger.dimondBackgroundMoneyInWalletScreen)),
                        Row(
                          children: [
                            SizedBox(width: 16.w,),
                            Image.asset(AssetsManger.dimondMoneyInWalletScreen),
                            const Expanded(child: SizedBox()),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 16.h,right: 16.w),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(context.localizations.walletScreenText3,style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        color: Colors.white
                                    ),),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16.h,right: 32.w),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("\$ 15.0",style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 36.sp,
                                        color: Colors.white
                                    ),),
                                  ),
                                ),
                
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),







          // // Content for "يتابعونك" Tab
          // ListView.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       return Column(
          //         children: [
          //           index == 0
          //               ? SizedBox(
          //             height: 16.h,
          //           )
          //               : SizedBox(
          //             height: 0.h,
          //           ),
          //           Padding(
          //             padding: EdgeInsets.only(right: 16.w, left: 16.w),
          //             child: Container(
          //               height: 77.h,
          //               width: double.infinity,
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(10.r),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.black.withOpacity(0.25),
          //                     offset: const Offset(0, 2),
          //                     blurStyle: BlurStyle.normal,
          //                     spreadRadius: 4,
          //                     blurRadius: 10,
          //                   ),
          //                 ],
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   IconButton(
          //                     onPressed: () {},
          //                     icon: const Icon(Icons.more_vert_outlined),
          //                   ),
          //                   Container(
          //                     height: 24.h,
          //                     width: 64.w,
          //                     decoration: BoxDecoration(
          //                       color: Colors.black,
          //                       borderRadius: BorderRadius.circular(5.r),
          //                     ),
          //                     child: Center(
          //                       child: Text(
          //                         "رسالة",
          //                         style: GoogleFonts.cairo(
          //                           color: Colors.white,
          //                           fontSize: 14.sp,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(width: 32.w),
          //                   Text(
          //                     "علي محمد إسماعيل ",
          //                     style: GoogleFonts.cairo(
          //                       fontWeight: FontWeight.w500,
          //                       fontSize: 14.sp,
          //                       color: Colors.black,
          //                     ),
          //                   ),
          //                   SizedBox(width: 8.w),
          //                   SizedBox(
          //                     height: 52.h,
          //                     width: 52.h,
          //                     child: Stack(
          //                       children: [
          //                         Container(
          //                           height: 48.h,
          //                           width: 48.w,
          //                           decoration: const BoxDecoration(
          //                             shape: BoxShape.circle,
          //                           ),
          //                           child: Image.asset(
          //                             "assets/images/home_screen_images/profile_image_num2.png",
          //                             height: 48.h,
          //                             width: 48.w,
          //                             fit: BoxFit.contain,
          //                           ),
          //                         ),
          //                         Align(
          //                           alignment: Alignment.bottomRight,
          //                           child: Padding(
          //                             padding: EdgeInsets.only(
          //                                 bottom: 6.h, right: 6.w),
          //                             child: Container(
          //                               height: 8.h,
          //                               width: 8.w,
          //                               decoration: BoxDecoration(
          //                                 color: Colors.green,
          //                                 shape: BoxShape.circle,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   SizedBox(width: 16.w),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 16.h,
          //           ),
          //         ],
          //       );
          //     }),
          // // Content for "تتابعهم" Tab
          // ListView.builder(
          //   itemCount: 3,
          //   itemBuilder: (context, index) {
          //     return Column(
          //       children: [
          //         index == 0
          //             ? SizedBox(
          //           height: 16.h,
          //         )
          //             : SizedBox(
          //           height: 0.h,
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(right: 16.w, left: 16.w),
          //           child: Container(
          //             height: 77.h,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(10.r),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.black.withOpacity(0.25),
          //                   offset: const Offset(0, 2),
          //                   blurStyle: BlurStyle.normal,
          //                   spreadRadius: 4,
          //                   blurRadius: 10,
          //                 ),
          //               ],
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               children: [
          //                 IconButton(
          //                   onPressed: () {},
          //                   icon: const Icon(Icons.more_vert_outlined),
          //                 ),
          //                 Container(
          //                   height: 24.h,
          //                   width: 64.w,
          //                   decoration: BoxDecoration(
          //                     color: Colors.red,
          //                     borderRadius: BorderRadius.circular(5.r),
          //                   ),
          //                   child: Center(
          //                     child: Text(
          //                       "حذف",
          //                       style: GoogleFonts.cairo(
          //                         color: Colors.white,
          //                         fontSize: 14.sp,
          //                         fontWeight: FontWeight.w500,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(width: 32.w),
          //                 Text(
          //                   "علي محمد إسماعيل ",
          //                   style: GoogleFonts.cairo(
          //                     fontWeight: FontWeight.w500,
          //                     fontSize: 14.sp,
          //                     color: Colors.black,
          //                   ),
          //                 ),
          //                 SizedBox(width: 8.w),
          //                 SizedBox(
          //                   height: 52.h,
          //                   width: 52.h,
          //                   child: Stack(
          //                     children: [
          //                       Container(
          //                         height: 48.h,
          //                         width: 48.w,
          //                         decoration: const BoxDecoration(
          //                           shape: BoxShape.circle,
          //                         ),
          //                         child: Image.asset(
          //                           "assets/images/home_screen_images/profile_image_num2.png",
          //                           height: 48.h,
          //                           width: 48.w,
          //                           fit: BoxFit.contain,
          //                         ),
          //                       ),
          //                       Align(
          //                         alignment: Alignment.bottomRight,
          //                         child: Padding(
          //                           padding: EdgeInsets.only(
          //                               bottom: 6.h, right: 6.w),
          //                           child: Container(
          //                             height: 8.h,
          //                             width: 8.w,
          //                             decoration: const BoxDecoration(
          //                               color: Colors.green,
          //                               shape: BoxShape.circle,
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 SizedBox(width: 16.w),
          //               ],
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 16.h,
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
