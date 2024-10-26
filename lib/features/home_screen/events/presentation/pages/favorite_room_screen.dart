import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';

import '../widgets/chat_rooms_bottom_the_countries.dart';

class FavoriteRoomScreen extends StatelessWidget {
  const FavoriteRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: ScreenUtilNew.height(16),),
          SizedBox(
            height: 160*5 +50,
            child: GridView.builder(
                itemCount: 10,
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
                  return ChatRoomsBottomTheCountries(title: "تعالو تعالو",imagePath: AssetsManger.bestAgency1,flagPath: AssetsManger.palestineFlag,);
                }
            ),
          ),
          SizedBox(height: ScreenUtilNew.height(80),),
        ],
      ),
    );
  }
}
