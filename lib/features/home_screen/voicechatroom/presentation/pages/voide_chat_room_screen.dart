import 'package:flutter/material.dart';
import 'package:ghala_new_app/core/utils/app_colors.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveAudioRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("غرفة الخطابة إم عثمان",style: GoogleFonts.cairo(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.colorPurpleInLogin
        ),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // backgroundColor: Color(0XFF66A6BA),
      ),
      body: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: 858267989,
        appSign: "29e7fa1d649abe519e91df5aff2d0f56451cf44f3a9fd1da6cce644551c902d7",
        userID: 'okasovvkaoskaok12121',
        userName: 'ALI2131',
        roomID: '2',
          config: ZegoUIKitPrebuiltLiveAudioRoomConfig.host(
          )..userAvatarUrl = "https://i.imgur.com/BoN9kdC.png"..background=background()..inRoomMessage=ZegoLiveAudioRoomInRoomMessageConfig(
            showName: false,
            resendIcon: IconButton(onPressed: (){}, icon: Icon(Icons.update)),
            bottomLeft: Offset(ScreenUtilNew.width(16),ScreenUtilNew.height(16)),
            backgroundColor:AppColors.colorPurpleInLogin.withOpacity(0.25),

            showAvatar: false,
            height: ScreenUtilNew.height(400),
            borderRadius: BorderRadius.circular(10),
            messageTextStyle: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
            paddings: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(24),vertical: ScreenUtilNew.height(4)),
            nameTextStyle: GoogleFonts.cairo(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          )..useSpeakerWhenJoining=true
      ),
    );
  }

  Widget background() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white
            // gradient: AppColors.backgroundSplashScreen
          ),
        ),
      ],
    );
  }
}