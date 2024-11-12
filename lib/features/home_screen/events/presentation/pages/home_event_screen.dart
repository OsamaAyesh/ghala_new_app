import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/home_screen/events/presentation/pages/server_countrys_screen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../state_management/test_home.dart';
import '../widgets/best_agencies_big_container.dart';
import '../widgets/best_agencies_small_container.dart';
import '../widgets/chat_rooms_bottom_the_countries.dart';

class HomeEventScreen extends StatefulWidget {
  const HomeEventScreen({super.key});

  @override
  State<HomeEventScreen> createState() => _HomeEventScreenState();
}

class _HomeEventScreenState extends State<HomeEventScreen> {
  List<String> imagesPath=[AssetsManger.bestAgency1,AssetsManger.bestAgency2,AssetsManger.bestAgency3,AssetsManger.bestAgency1];
  List<String> strings=[
    "فوت مش هتموت ",
    "السلاطين",
    "قعدة ام اسماعيل",
    "برتقالة سورية الأصل",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtilNew.height(16)),
            Padding(
              padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left: ScreenUtilNew.width(16)),
              child: Text(
                context.localizations.homeScreenText3,
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(158),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ScreenUtilNew.width(16),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: index == 19 ? ScreenUtilNew.width(16) : 0),
                        child: Container(
                          height: ScreenUtilNew.height(134),
                          width: ScreenUtilNew.width(291),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                                color: AppColors.colorPurpleSecondary,
                                offset: Offset(0, 2),
                                // لتعديل مكان الظل ليكون محددًا
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            // إضافة حواف مستديرة للصورة
                            child: Image.asset(
                              AssetsManger.adsTestImage,
                              height: ScreenUtilNew.height(134),
                              width: ScreenUtilNew.width(291),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: ScreenUtilNew.height(8)),
            Padding(
              padding: EdgeInsets.only(right: ScreenUtilNew.width(16),left: ScreenUtilNew.width(16)),
              child: Text(
                context.localizations.homeScreenText4,
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: ScreenUtilNew.height(8)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageAnimationTransition(
                            page:    HomeScreen1(),
                            pageAnimationType: BottomToTopTransition()));
                      },
                      child: BestAgenciesBigContainer(
                        title: "تعالو تعالو",
                        imageStateFlag: AssetsManger.palestineFlag,
                        numberOfRegister: "23",
                        pathImage: AssetsManger.bestAgency1,
                      )),
                  const Expanded(child: SizedBox()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BestAgenciesSmallContainer(
                        title: "تعالو تعالو",
                        imageStateFlag: AssetsManger.palestineFlag,
                        numberOfRegister: "23",
                        pathImage: AssetsManger.bestAgency3,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      BestAgenciesSmallContainer(
                        title: "تعالو تعالو",
                        imageStateFlag: AssetsManger.palestineFlag,
                        numberOfRegister: "23",
                        pathImage: AssetsManger.bestAgency2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtilNew.height(16)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Text(
                context.localizations.homeScreenText5,
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: ScreenUtilNew.height(8)),
            Stack(
              children: [
                SizedBox(
                  height: ScreenUtilNew.height(19),
                  child: ListView.builder(
                      itemCount: AppStrings.countries.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: ScreenUtilNew.width(index==0?16:8),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(PageAnimationTransition(
                                    page:   ServerCountrysScreen(nameServer: AppStrings.countries[index]),
                                    pageAnimationType: BottomToTopTransition()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    // left: index ==
                                    //         AppStrings.countries.length - 1
                                    //     ? ScreenUtilNew.width(16)
                                    //     : 0,
                                    // right: index == 0
                                    //     ? ScreenUtilNew.width(8)
                                    //     : 0
                                ),
                                child: Container(
                                  height: ScreenUtilNew.height(19),
                                  width: ScreenUtilNew.width(68),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: AppColors.colorPurpleSecondary,
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppStrings.countries[index],
                                      style: GoogleFonts.cairo(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              AppColors.colorPurpleInLogin),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        );
                      }),
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Container(
                      height: ScreenUtilNew.height(24),
                      width: ScreenUtilNew.height(48),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Container(
                          height: 16.h,
                          width: 16.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colorPurpleSecondary,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: AppColors.colorPurpleInLogin,
                            size: 8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 160*2+96,
              child: GridView.builder(
                itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 160,
                    crossAxisSpacing: 10.w,
                  ),
                  itemBuilder: (context,index){
                return ChatRoomsBottomTheCountries(title: "تعالو تعالو",imagePath: AssetsManger.bestAgency1,flagPath:AssetsManger.palestineFlag,);
              }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
