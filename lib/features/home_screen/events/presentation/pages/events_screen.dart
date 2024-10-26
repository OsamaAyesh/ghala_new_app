import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/features/home_screen/events/presentation/pages/search_in_event_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/screen_util_new.dart';
import 'home_event_screen.dart';
import 'my_rooms_event_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with TickerProviderStateMixin {
  List<Widget> screensTabBar = [
    const HomeEventScreen(),
    const MyRoomsEventScreen(),
    // HomeEventScreen(),
    // MyRoomsEventScreen(),
  ];
  int index = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(PageAnimationTransition(
                    page:   const SearchInEventScreen(),
                    pageAnimationType: BottomToTopTransition()));
              },
              icon: const Icon(
                Icons.search,
                size: 32,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: ScreenUtilNew.width(16),
            ),

            GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      context.localizations.homeScreenText1,
                      style:index ==0? GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: const Color(0XFF0A1D56)):GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: const Color(0XFF8D8787)),
                    ),
                    index ==0? SizedBox(height: ScreenUtilNew.height(10),):const SizedBox(height: 0,),
                    index ==0? Container(
                      height: ScreenUtilNew.height(2),
                      width:  ScreenUtilNew.height(27),
                      color: const Color(0XFF0A1D56),
                    ):SizedBox(                      height: ScreenUtilNew.height(2),
                      width:  ScreenUtilNew.height(27),),
                  ],
                )),
            SizedBox(
              width: ScreenUtilNew.width(24),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      context.localizations.homeScreenText2,
                      style: index == 1
                          ? GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: const Color(0XFF0A1D56))
                          : GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: const Color(0XFF8D8787)),
                    ),
                    index ==1? SizedBox(height: ScreenUtilNew.height(10),):const SizedBox(height: 0,),
                    index ==1? Container(
                      height: ScreenUtilNew.height(2),
                      width:  ScreenUtilNew.height(27),
                      color: const Color(0XFF0A1D56),
                    ):SizedBox( height: ScreenUtilNew.height(2),
                      width:  ScreenUtilNew.height(27),),
                  ],
                )),

          ],
        ),
      ),
      body: screensTabBar[index],
    );
  }
}
