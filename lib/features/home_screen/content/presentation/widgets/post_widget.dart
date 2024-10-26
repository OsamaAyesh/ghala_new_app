import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_colors.dart';


class PostWidget extends StatelessWidget {
  String namePostedPost;
  String timePostedIt;
  String descriptionPost;
  String pathImage;
  int numberLikesPost;
  int numberCommentedPost;

   PostWidget({
    super.key,
    required this.namePostedPost,
    required this.timePostedIt,
    required this.descriptionPost,
    required this.pathImage,
    required this.numberLikesPost,
    required this.numberCommentedPost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtilNew.height(415),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: ScreenUtilNew.height(35),
                  backgroundImage:  AssetImage(pathImage),
                ),
                SizedBox(
                  width:ScreenUtilNew.width(8),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namePostedPost,
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0XFFA0ADA8),
                        ),
                        Text(
                          timePostedIt,
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFFA0ADA8),
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_horiz),
                  // Three-dot horizontal icon
                  onSelected: (String result) {
                    // Handle menu item selection
                    if(result=='Option 1'){
                      context.showSnackBar(message: "تم إخفاء المنشور",erorr: false);
                      print("$result =1");
                    }else{
                      context.showSnackBar(message: "تم حفظ المنشور",erorr: false);
                      print("$result =2");
                    }
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'Option 1',
                      child: Text('اخفاء المنشور',style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorPurpleInLogin,
                      ),),
                    ),
                    PopupMenuItem<String>(
                      value: 'Option 2',
                      child:  Text('حفظ المنشور',style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorPurpleInLogin,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtilNew.height(8),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
            child: Text(
              descriptionPost,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0XFFAA9797),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
          SizedBox(
            height: ScreenUtilNew.height(16),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:ScreenUtilNew.width(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                AssetsManger.postImage,
                height: ScreenUtilNew.height(196),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up_off_alt,
                    color: AppColors.colorPurpleInLogin,
                  )),
                Text(
                  "$numberLikesPost",
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorPurpleInLogin,
                  ),
                ),
                SizedBox(
                  width:ScreenUtilNew.width(8),
                ),
            
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment,
                      color: AppColors.colorPurpleInLogin,
                    )),
                Text(
                  "$numberCommentedPost",
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorPurpleInLogin,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
