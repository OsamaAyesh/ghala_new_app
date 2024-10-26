import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/home_screen/game/presentation/pages/game_screen.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/pages/profile_screen.dart';

import '../../core/utils/app_colors.dart';
import 'content/presentation/pages/content_screen.dart';
import 'events/presentation/pages/events_screen.dart';
import 'messages/presentation/pages/messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens=[
    const EventsScreen(),
    const MessagesScreen(),
    const ContentScreen(),
    const GameScreen(),
    const ProfileScreen()
    // EventsScreen(),
    // MessagesScreen(),
    // ContentScreen(),
    // GameScreen(),
    // ProfileScreen(),
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        margin:  EdgeInsets.only(left: ScreenUtilNew.width(16), bottom: ScreenUtilNew.width(16), right: ScreenUtilNew.width(16)),
        height: ScreenUtilNew.height(64),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.colorPurpleInLogin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
            onTap: (){
              setState(() {
                index=0;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                index==0? Container(
                  height: ScreenUtilNew.height(5),
                  width: ScreenUtilNew.width(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.colorPurpleSecondary,
                  ),
                ):SizedBox( height:ScreenUtilNew.height(1),
                  width: ScreenUtilNew.height(32),),
                SvgPicture.asset(
                  index==0?AssetsManger.eventIconPurple:AssetsManger.eventIconWhite,
                  width: ScreenUtilNew.width(32),
                  height: ScreenUtilNew.height(32),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
            GestureDetector(
              onTap: (){
                setState(() {
                  index=1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index==1? Container(
                    height: ScreenUtilNew.height(5),
                    width: ScreenUtilNew.width(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.colorPurpleSecondary,
                    ),
                  ):SizedBox( height:ScreenUtilNew.height(1),
                    width: ScreenUtilNew.height(32),),
                  SvgPicture.asset(
                    index==1?AssetsManger.messageIconPurple:AssetsManger.messageIconWhite,
                    width: ScreenUtilNew.width(32),
                    height: ScreenUtilNew.height(32),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  index=2;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index==2? Container(
                    height: ScreenUtilNew.height(5),
                    width: ScreenUtilNew.width(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.colorPurpleSecondary,
                    ),
                  ):SizedBox( height:ScreenUtilNew.height(1),
                    width: ScreenUtilNew.height(32),),
                  SvgPicture.asset(
                    index==2?AssetsManger.webIconPurple:AssetsManger.webIconWhite,
                    width: ScreenUtilNew.width(32),
                    height: ScreenUtilNew.height(32),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  index=3;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index==3? Container(
                    height: ScreenUtilNew.height(5),
                    width: ScreenUtilNew.width(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.colorPurpleSecondary,
                    ),
                  ):SizedBox( height:ScreenUtilNew.height(1),
                    width: ScreenUtilNew.height(32),),
                  SvgPicture.asset(
                    index==3?AssetsManger.gameIconPurple:AssetsManger.gameIconWhite,
                    width: ScreenUtilNew.width(32),
                    height: ScreenUtilNew.height(32),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  index=4;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index==4? Container(
                    height: ScreenUtilNew.height(5),
                    width: ScreenUtilNew.width(32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.colorPurpleSecondary,
                    ),
                  ): SizedBox( height:ScreenUtilNew.height(1),
                    width: ScreenUtilNew.height(32),),
                  SvgPicture.asset(
                    index==4?AssetsManger.profileIconPurple:AssetsManger.profileIconWhite,
                    width: ScreenUtilNew.width(32),
                    height: ScreenUtilNew.height(32),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: screens[index]
    );
  }
}
