import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:google_fonts/google_fonts.dart';
class VerificationCodeTextField extends StatelessWidget {
final TextEditingController textEditingController;
void Function(String)? onChanged;
double widthTextFiled;
// FocusNode focusNode;
@override
  bool enabled;
   VerificationCodeTextField({super.key,required this.textEditingController,required this.onChanged,required this.widthTextFiled,required this.enabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtilNew.height(60),
      width: widthTextFiled,
      child: TextField(
        // focusNode: focusNode,
        onChanged:onChanged ,

        inputFormatters:[
          LengthLimitingTextInputFormatter(1),
        ],
        // maxLength: 1,
        style: GoogleFonts.cairo(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: textEditingController,
        decoration: InputDecoration(
          enabled:enabled ,

          fillColor: const Color(0XFFEBE9F2),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
