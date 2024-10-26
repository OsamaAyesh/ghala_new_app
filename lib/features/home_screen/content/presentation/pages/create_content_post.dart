import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/app_strings.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/home_screen/content/presentation/widgets/custom_button.dart';
import 'package:ghala_new_app/features/home_screen/content/presentation/widgets/text_filed_custom.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import '../../../../../core/utils/app_colors.dart';

class CreateContentPost extends StatefulWidget {
  const CreateContentPost({super.key});

  @override
  State<CreateContentPost> createState() => _CreateContentPostState();
}

class _CreateContentPostState extends State<CreateContentPost> {
  late TextEditingController descriptionTextEditingController;

  File? _image; // لتخزين الصورة المختارة
  // final ImagePicker _picker = ImagePicker();

  // اختيار صورة من المعرض
  // Future<void> _pickImageFromGallery() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  // // التقاط صورة باستخدام الكاميرا
  // Future<void> _pickImageFromCamera() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    descriptionTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          context.localizations.createPostsScreenText1,
          style: GoogleFonts.cairo(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.colorPurpleInLogin),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtilNew.height(8),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Text(
                context.localizations.createPostsScreenText2,
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.colorPurpleInLogin,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(8),
            ),
            TextFiledCustom(
                textEditingController: descriptionTextEditingController,
                hintText: context.localizations.createPostsScreenText3,
                maxLines: 10,
                minLines: 5),
            SizedBox(
              height: ScreenUtilNew.height(16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Text(
                context.localizations.createPostsScreenText4,
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.colorPurpleInLogin,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(8),
            ),
            GestureDetector(
              // onTap: _pickImageFromGallery,
              onTap: () {},
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                child: Container(
                  height: 64.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: const Color(0XFFEBE6FF),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.upload,
                        color: Color(0XFFA89E9E),
                      ),
                      SizedBox(width: ScreenUtilNew.width(8),),
                      Text(
                        context.localizations.createPostsScreenText5,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: const Color(0XFFA89E9E),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(24),
            ),
            CustomButton(
                onPressed: () {},
                text: context.localizations.createPostsScreenText6,
                backgroundColor: AppColors.colorPurpleInLogin,
                padding: 16.w)
          ],
        ),
      ),
    );
  }
}
