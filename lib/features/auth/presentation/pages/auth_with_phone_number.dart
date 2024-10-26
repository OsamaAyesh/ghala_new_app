import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/pages/verfication_code_phone_number_screen.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/custom_button.dart';


class AuthWithPhoneNumber extends StatelessWidget {
  const AuthWithPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    String initialCountry = 'US';
    PhoneNumber number = PhoneNumber(isoCode: initialCountry);
    String phoneNumberString="+9709283928";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          context.localizations.phoneAuthScreenText1,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            color: AppColors.colorPurpleInLogin,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
      ),
      body: Stack(
        children: [
          const ImageBackground(),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtilNew.height(132)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      AssetsManger.phoneAuthImage,
                      width: ScreenUtilNew.width(330),
                      height: ScreenUtilNew.height(305),
                      fit: BoxFit.contain,
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtilNew.height(24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Text(
                        context.localizations.phoneAuthScreenText2,
                        style: GoogleFonts.cairo(
                          color: AppColors.colorPurpleInLogin,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(height:ScreenUtilNew.height(8) ,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: InternationalPhoneNumberInput(
                        // textAlign: TextAlign.end,
                        onInputChanged: (PhoneNumber phoneNumber) {
                          print(phoneNumber.phoneNumber);
                          phoneNumberString=phoneNumber.phoneNumber!;
                        },
                        onInputValidated: (bool isValid) {
                          print(isValid ? 'Valid number' : 'Invalid number');
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          leadingPadding: ScreenUtilNew.width(16),
                          setSelectorButtonAsPrefixIcon: true,
                          showFlags: true,
                          trailingSpace: true,
                          useBottomSheetSafeArea: true,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        selectorTextStyle: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                        initialValue: number,
                        textFieldController: TextEditingController(),
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputDecoration: InputDecoration(
                          errorStyle: GoogleFonts.cairo(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                          prefixIcon: const Icon(Icons.call),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.colorPurpleInLogin,
                              ),
                              borderRadius: BorderRadius.circular(20.r)),
                          labelText: context.localizations.phoneAuthScreenText3,
                          labelStyle: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                        onSaved: (PhoneNumber phoneNumber) {
                          print(
                              'Saved phone number: ${phoneNumber.phoneNumber}');
                        },
                      ),
                    ),
                    SizedBox(height:ScreenUtilNew.height(24) ,),
                    CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(PageAnimationTransition(
                            page:   VerficationCodePhoneNumberScreen(phoneNumber:phoneNumberString.replaceFirst("+", "") ,),
                            pageAnimationType: BottomToTopTransition()));
                      },
                      text: context.localizations.phoneAuthScreenText4,
                      backgroundColor: AppColors.colorPurpleInLogin,
                      padding: ScreenUtilNew.width(16),),
                  ],
                )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
