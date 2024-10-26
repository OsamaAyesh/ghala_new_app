import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manger.dart';
import '../../../../auth/presentation/widgets/custom_button.dart';
import '../../../events/presentation/widgets/text_filed_custom.dart';


class CreateNewGroup extends StatefulWidget {
  const CreateNewGroup({super.key});

  @override
  State<CreateNewGroup> createState() => _CreateNewGroupState();
}

class _CreateNewGroupState extends State<CreateNewGroup> {
  late TextEditingController nameGroupTextEditingController;
  late TextEditingController descriptionGroupTextEditingController;


  @override
  void initState() {
    // TODO: implement initState
    nameGroupTextEditingController=TextEditingController();
    descriptionGroupTextEditingController=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameGroupTextEditingController.dispose();
    descriptionGroupTextEditingController.dispose();
    super.dispose();
  }
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
            Icons.arrow_back_ios,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          context.localizations.createGroupScreenText1,
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
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: ScreenUtilNew.height(132)),
              child: Column(
                children: [
                  SizedBox(
                    width: ScreenUtilNew.width(140),
                    height: ScreenUtilNew.height(140),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: ScreenUtilNew.width(140),
                            height: ScreenUtilNew.height(140),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.colorPurpleInLogin),
                            child: Image.asset(
                              AssetsManger.logoPurpleSecondaryInCreateRoom,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: ScreenUtilNew.height(4), right: ScreenUtilNew.width(4)),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: ScreenUtilNew.height(30),
                              width: ScreenUtilNew.width(30),
                              decoration: const BoxDecoration(
                                  color: AppColors.colorPurpleSecondary,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.camera_enhance_outlined,
                                color: AppColors.colorPurpleInLogin,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtilNew.height(32),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.group_sharp,
                          color: AppColors.colorPurpleInLogin,
                        ),
                        SizedBox(
                          width: ScreenUtilNew.width(4),
                        ),
                        Text(
                          context.localizations.createGroupScreenText2,
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: AppColors.colorPurpleInLogin),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(8),),
                  TextFiledCustom(textEditingController:nameGroupTextEditingController , hintText: context.localizations.createGroupScreenText3, maxLines: 6, minLines: 1),
                  SizedBox(height: ScreenUtilNew.height(16),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.description_outlined,
                          color: AppColors.colorPurpleInLogin,
                        ),
                        SizedBox(
                          width: ScreenUtilNew.width(4),
                        ),
                        Text(
                          context.localizations.createGroupScreenText6,
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: AppColors.colorPurpleInLogin),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(8),),
                  TextFiledCustom(textEditingController:descriptionGroupTextEditingController , hintText: context.localizations.createGroupScreenText5, maxLines: 10, minLines: 6),
                  SizedBox(height: ScreenUtilNew.height(64),),
                  CustomButton(onPressed: (){}, text: context.localizations.createGroupScreenText6, backgroundColor: AppColors.colorPurpleInLogin,padding: ScreenUtilNew.width(16),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
