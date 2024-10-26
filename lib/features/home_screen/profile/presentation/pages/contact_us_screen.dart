import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/home_screen/profile/presentation/widgets/text_field_in_contact_us.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/custom_button.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late TextEditingController firstNameTextEditingController;
  late TextEditingController lastNameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController messageTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    firstNameTextEditingController = TextEditingController();
    lastNameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    messageTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    messageTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFE0DBF6),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        centerTitle: true,
        title: Text(
          context.localizations.contactUsScreenText1,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: ScreenUtilNew.height(346),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0XFFE0DBF6),
              ),
            ),
            Column(
              children: [
                Image.asset(
                  AssetsManger.contactUsImage,
                  height: ScreenUtilNew.height(206),
                  width: ScreenUtilNew.width(270),
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtilNew.width(16)),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.colorPurpleInLogin
                                .withOpacity(0.25),
                            offset: const Offset(0, 3),
                            blurStyle: BlurStyle.normal,
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtilNew.height(16),
                        ),
                        Text(
                          context.localizations.contactUsScreenText2,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: AppColors.colorPurpleInLogin,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtilNew.height(16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFieldInContactUs(
                                  hintText: context.localizations.contactUsScreenText3,
                                  textEditingController:
                                  firstNameTextEditingController,
                                  widthTextField: double.infinity,
                                  minLines: 1,
                                  maxLines: 3,
                                ),
                              ),
                              SizedBox(
                                width: ScreenUtilNew.width(8),
                              ),
                              Expanded(
                                child: TextFieldInContactUs(
                                  hintText: context.localizations.contactUsScreenText4,
                                  textEditingController:
                                      lastNameTextEditingController,
                                  widthTextField: double.infinity,
                                  minLines: 1,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtilNew.height(12),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                            child: TextFieldInContactUs(
                              hintText: context.localizations.contactUsScreenText5,
                              textEditingController:
                                  emailTextEditingController,
                              widthTextField: double.infinity,
                              minLines: 1,
                              maxLines: 3,
                            )),
                        SizedBox(
                          height: ScreenUtilNew.height(12),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                            child: TextFieldInContactUs(
                              hintText: context.localizations.contactUsScreenText6,
                              textEditingController:
                                  messageTextEditingController,
                              widthTextField: double.infinity,
                              minLines: 5,
                              maxLines: 10,
                            )),
                        // const Expanded(child: SizedBox()),
                        SizedBox(
                          height: ScreenUtilNew.height(16),
                        ),
                        CustomButton(
                            onPressed: () {},
                            text: context.localizations.contactUsScreenText7,
                            backgroundColor: AppColors.colorPurpleInLogin,
                            padding: ScreenUtilNew.width(16)),
                        SizedBox(
                          height: ScreenUtilNew.height(16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(16),
                ),
                Text(
                  context.localizations.contactUsScreenText8,
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: const Color(0XFF9C9C9C)),
                ),
                SizedBox(
                  height: ScreenUtilNew.height(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AssetsManger.instagramLogoInContactUs,
                      height: ScreenUtilNew.height(42),
                      width: ScreenUtilNew.width(42),
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      AssetsManger.facebookLogoInContactUs,
                      height: ScreenUtilNew.height(42),
                      width: ScreenUtilNew.width(42),
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      AssetsManger.snapchatLogoInContactUs,
                      height: ScreenUtilNew.height(42),
                      width: ScreenUtilNew.width(42),
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtilNew.height(32),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
