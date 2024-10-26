import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/app_strings.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../widgets/center_games.dart';
import '../widgets/rooms_games.dart';



class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin{
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
          Image.asset(
            AssetsManger.gameBackgroundImage,
            height: ScreenUtilNew.height(290),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(left:ScreenUtilNew.width(16), right: ScreenUtilNew.width(16), top: ScreenUtilNew.height(190)),
            child: Container(
              // height: ScreenUtilNew.height(700),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                      spreadRadius: 10,
                    ),
                  ],
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(height: ScreenUtilNew.height(8),),
                  TabBar(
                    indicatorColor: AppColors.colorPurpleInLogin,
                    dividerColor: Colors.transparent,
                    unselectedLabelStyle: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF8D8787)
                    ),
                    labelStyle: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorPurpleInLogin
                    ),
                    controller:_tabController,
                      tabs:  [
                    Tab(
                      child: Text(context.localizations.game_Screen_text2),
                    ),
                    Tab(
                      child: Text(context.localizations.game_Screen_text1),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(
                      controller:_tabController,
                      children: const [
                        RoomsGames(),
                        CenterGames(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
