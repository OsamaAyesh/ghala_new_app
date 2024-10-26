import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/home_screen/messages/presentation/pages/search_users.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/animations/left_to_right_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../events/presentation/widgets/tab_item_in_my_rooms.dart';
import 'create_new_group.dart';
import 'events_ghala_screen.dart';
import 'ghala_team.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> with SingleTickerProviderStateMixin{
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
      body: Stack(
        children: [
          SafeArea(
            child: Row(
              children: [
                SizedBox(
                  width: ScreenUtilNew.width(16),
                ),
                Padding(
                  padding: EdgeInsets.only(right: ScreenUtilNew.width(16)),
                  child: Text(
                    context.localizations.messagesScreenText1,
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorPurpleInLogin,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page:   const SearchUsers(),
                        pageAnimationType: BottomToTopTransition()));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: AppColors.colorPurpleInLogin,
                    size: 24,
                  ),
                ),
                SizedBox(
                  width: ScreenUtilNew.width(8),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(PageAnimationTransition(
                        page:   const CreateNewGroup(),
                        pageAnimationType: LeftToRightTransition()));
                  },
                  icon: const Icon(
                    Icons.add_circle_outline_outlined,
                    color: AppColors.colorPurpleInLogin,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtilNew.height(96)),
            child: Column(
              children: [
                SizedBox(height: ScreenUtilNew.height(24),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(PageAnimationTransition(
                            page:   const GhalaTeam(),
                            pageAnimationType: BottomToTopTransition()));
                      },
                      child: Container(
                        height:ScreenUtilNew.height(85),
                        width: ScreenUtilNew.width(85),
                        decoration: BoxDecoration(
                          color: AppColors.colorPurpleInLogin,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              AssetsManger.ghalaTeamImage,height: ScreenUtilNew.height(42),width: ScreenUtilNew.height(52),
                              fit: BoxFit.contain,),
                            Text(
                              context.localizations.messagesScreenText2,
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: ScreenUtilNew.width(64),),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(PageAnimationTransition(
                            page:   const EventsGhalaScreen(),
                            pageAnimationType: BottomToTopTransition()));
                      },
                      child: Container(
                        height:ScreenUtilNew.height(85),
                        width: ScreenUtilNew.width(85),
                        decoration: BoxDecoration(
                          color: AppColors.colorPurpleInLogin,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsManger.ghalaEventImage,height: ScreenUtilNew.height(52),width: ScreenUtilNew.width(52),
                              fit: BoxFit.contain,),
                            Text(
                              context.localizations.messagesScreenText3,
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ScreenUtilNew.height(16)),
                Container(
                  height: ScreenUtilNew.height(42),
                  margin:  EdgeInsets.symmetric(horizontal:ScreenUtilNew.width(16)),
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
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                    tabs:  [
                      TabItem(title: context.localizations.messagesScreenText5, count: 6),
                      TabItem(title: context.localizations.messagesScreenText4, count: 3),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children:  [
                      Center(child: Text("لا يوجد بيانات",style: GoogleFonts.cairo(
                        color: AppColors.colorPurpleInLogin
                      ),)),
                      Center(child: Text("لا يوجد بيانات",style: GoogleFonts.cairo(
                          color: AppColors.colorPurpleInLogin
                      ),)),                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
