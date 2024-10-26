import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/post_widget.dart';
import 'create_content_post.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          context.localizations.postsScreenText1,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
      ),
      body: Stack(
        children: [
          const ImageBackground(),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtilNew.height(16)),
            child: ListView.builder(
              // Removed Expanded here
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    PostWidget(
                      pathImage: AssetsManger.bestAgency1,
                      descriptionPost:
                          "صورة تعرض واجهة مستخدم لتطبيق غلا تُظهر غرف الدردشة المختلفة مع مستخدمين يتحدثون. (إذا كنت بحاجة إلى صورة محددة، يمكنك إنشاء تصميم ",
                      namePostedPost: "جون ابراهيم",
                      timePostedIt: "37د",
                      numberCommentedPost: 12,
                      numberLikesPost: 31,
                    ),
                    SizedBox(height: ScreenUtilNew.height(32)),
                  ],
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageAnimationTransition(
                  page: const CreateContentPost(),
                  pageAnimationType: BottomToTopTransition()));
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 84.h, left: 16.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 52.h,
                  width: 52.w,
                  decoration: BoxDecoration(
                      color: AppColors.colorPurpleSecondary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 10,
                            offset: Offset(0, 2))
                      ]),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
