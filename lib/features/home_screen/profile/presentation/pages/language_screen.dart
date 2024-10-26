import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/services/shared_pref_controller.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/state_management/chnage_language_controller.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class LanguageScreen extends StatefulWidget {
  LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> languages = [
    AppStrings.languageScreen2,
    AppStrings.languageScreen3
  ];




  @override
  Widget build(BuildContext context) {

    int pageIndex;
    String languageCode = Localizations.localeOf(context).languageCode;
    if (languageCode == 'en') {
      pageIndex = 1;
    } else if (languageCode == 'ar') {
      pageIndex = 0;
    }else{
      pageIndex=1;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: Text(
          context.localizations.languageScreenText1,
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              color: AppColors.colorPurpleInLogin,
              fontSize: 16.sp),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: ScreenUtilNew.height(16),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
               return Selector<ChangeLanguage, String>(
                  selector: (context, controller) => controller.selectedLanguage,
                  builder: (context, selectedLanguage, child) {
                    return  GestureDetector(
                      onTap: () {
                        setState(() {
                          pageIndex = index;
                        });
                        Provider.of<ChangeLanguage>(context, listen: false).selectedLanguage = index==0?"ar":"en";

                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenUtilNew.height(16),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtilNew.width(16)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.done,
                                  color: pageIndex == index
                                      ? AppColors.colorPurpleInLogin
                                      : Colors.transparent,
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  languages[index],
                                  style: GoogleFonts.cairo(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: pageIndex == index
                                          ? AppColors.colorPurpleInLogin
                                          : Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtilNew.height(16),
                          ),
                          Divider(
                            endIndent: ScreenUtilNew.width(8),
                            indent: ScreenUtilNew.width(8),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  },
                );


              },
            ),
          )
        ],
      ),
    );
  }
}
