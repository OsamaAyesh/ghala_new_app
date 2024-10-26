import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/features/home_screen/game/presentation/widgets/chat_rooms_bottom_the_countries.dart';

import '../../../../../core/utils/screen_util_new.dart';



class RoomsGames extends StatelessWidget {
  const RoomsGames({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height:ScreenUtilNew.height(16),),
          GridView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                mainAxisExtent: 160,
                crossAxisSpacing: 10.w,
              ),
              itemBuilder: (context,index){
                return ChatRoomsBottomTheCountries(imagePath: AssetsManger.bestAgency1,title: "تعالو",flagPath: AssetsManger.palestineFlag,);
              }
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
          //   child: Container(
          //     height: 80.h,
          //     width: double.infinity,
          //     decoration: BoxDecoration(color: Colors.white, boxShadow: [
          //       BoxShadow(
          //         color: AppColors.colorPurpleInLogin,
          //         offset: Offset(0, 3),
          //         blurStyle: BlurStyle.normal,
          //         spreadRadius: 10,
          //       )
          //     ]),
          //   ),
          // ),
          SizedBox(height:ScreenUtilNew.height(120),),

        ],
      ),
    );
  }
}
