import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:ghala_new_app/core/utils/context_extension.dart";
import "package:google_fonts/google_fonts.dart";

import "../../../../../core/utils/app_colors.dart";
import "../../../../../core/utils/app_strings.dart";
import "../../../../../core/utils/assets_manger.dart";
import "../../../../../core/utils/screen_util_new.dart";
import "../../../../auth/presentation/widgets/image_background.dart";
import "../widgets/ghala_event_and_team_container.dart";


class GhalaTeam extends StatelessWidget {
  const GhalaTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          context.localizations.ghalaEventScreenText1,
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
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GhalaEventAndTeamContainer(imagePath: AssetsManger.postImageGhalaTeamAndEvent,title: "استكشفوا غلا: تطبيق الدردشة الصوتية الجديد",subTitle: "انضموا إلى غلا، حيث يجتمع الأصدقاء للحديث بصوتٍ عالٍ! اكتشفوا غرف الدردشة الصوتية الممتعة والمميزة لكل اهتماماتكم. حملوا التطبيق الآن واستمتعوا بتجربة دردشة فريدة وممتعة.",),
                            SizedBox(
                              height: ScreenUtilNew.height(16),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
