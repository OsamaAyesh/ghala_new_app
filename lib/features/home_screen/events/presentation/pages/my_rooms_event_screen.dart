import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/home_screen/events/presentation/pages/updated_rooms_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/tab_item_in_my_rooms.dart';
import 'create_room.dart';
import 'favorite_room_screen.dart';
import 'new_rooms_screen.dart';

class MyRoomsEventScreen extends StatefulWidget {
  const MyRoomsEventScreen({super.key});

  @override
  State<MyRoomsEventScreen> createState() => _MyRoomsEventScreenState();
}

class _MyRoomsEventScreenState extends State<MyRoomsEventScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length:2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: ScreenUtilNew.height(24)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageAnimationTransition(
                  page:   CreateRoom(),
                  pageAnimationType: BottomToTopTransition()));
            },
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.colorPurpleSecondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: ScreenUtilNew.height(91),
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenUtilNew.width(24),
                    ),
                    Container(
                      height: ScreenUtilNew.height(50),
                      width: ScreenUtilNew.width(50),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.colorPurpleInLogin,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtilNew.width(12),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.localizations.myRoomsScreenText3,
                          style: GoogleFonts.cairo(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorPurpleInLogin,
                          ),
                        ),
                        Text(
                          context.localizations.myRoomsScreenText4,
                          style: GoogleFonts.cairo(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorPurpleInLogin,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenUtilNew.height(16)),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPurpleSecondary,
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.colorPurpleInLogin,
                borderRadius: BorderRadius.circular(10),
              ),
              unselectedLabelStyle: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                color: AppColors.colorPurpleInLogin,
              ),
              labelStyle: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                fontSize: 11.sp,
                color: Colors.white,
              ),
              tabs:   [
                TabItem(title: context.localizations.myRoomsScreenText6,count: 1,),
                TabItem(title: context.localizations.myRoomsScreenText5,count: 1,)
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: const [
                UpdatedRoomsScreen(),
                FavoriteRoomScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
