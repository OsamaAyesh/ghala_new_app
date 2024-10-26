import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/title_sub_title_in_privacy_policy.dart';



class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          context.localizations.privacyTermsScreenText1,
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
            padding: EdgeInsets.only(top: ScreenUtilNew.height(124)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                child: Column(
                  children: [
                     TitleSubTitleInPrivacyPolicy(title: context.localizations.privacyTermsScreenText2,subTitle: context.localizations.privacyTermsScreenText3,),
                    SizedBox(
                      height: 16.h,
                    ),
                     TitleSubTitleInPrivacyPolicy(title: context.localizations.privacyTermsScreenText4,subTitle: context.localizations.privacyTermsScreenText5,),
                    SizedBox(
                      height: 16.h,
                    ),
                     TitleSubTitleInPrivacyPolicy(title: context.localizations.privacyTermsScreenText6,subTitle: context.localizations.privacyTermsScreenText7,),
                    SizedBox(
                      height: 16.h,
                    ),
                     TitleSubTitleInPrivacyPolicy(title: context.localizations.privacyTermsScreenText8,subTitle: context.localizations.privacyTermsScreenText9,),
                    SizedBox(
                      height: 16.h,
                    ),
                     TitleSubTitleInPrivacyPolicy(title: context.localizations.privacyTermsScreenText10,subTitle: context.localizations.privacyTermsScreenText11,),
                    SizedBox(
                      height: 16.h,
                    ),
                     TitleSubTitleInPrivacyPolicy(title: context.localizations.privacyTermsScreenText12,subTitle: context.localizations.privacyTermsScreenText13,),
                    SizedBox(
                      height: 16.h,
                    ),
                     TitleSubTitleInPrivacyPolicy(title: context.localizations.privacyTermsScreenText12,subTitle: context.localizations.privacyTermsScreenText13,),
                    SizedBox(
                      height: 32.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
