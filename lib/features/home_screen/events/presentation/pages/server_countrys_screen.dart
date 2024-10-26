import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';
import 'package:ghala_new_app/features/home_screen/events/presentation/widgets/chat_rooms_bottom_the_countries.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class ServerCountrysScreen extends StatelessWidget {
  final String nameServer;

  const ServerCountrysScreen({super.key,required this.nameServer });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: AppColors.colorPurpleInLogin,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          nameServer,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            color: AppColors.colorPurpleInLogin,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
       body: Stack(
         children: [
          const ImageBackground(),
           Padding(
             padding: EdgeInsets.only(top: ScreenUtilNew.height(16)),
             child: SafeArea(
               child: Column(
                 children: [
                   SizedBox(
                     height: 160*3+30,
                     child: GridView.builder(
                         itemCount: 3,
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
                           return ChatRoomsBottomTheCountries(imagePath:AssetsManger.bestAgency1 ,
                           flagPath: AssetsManger.palestineFlag,title: "تعالو تعالو",);
                         }
                     ),
                   ),
                 ],
               ),
             ),
           )

         ],
       ),
    );
  }
}
