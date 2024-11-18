import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/screen_util_new.dart';
class TextFieldAuth extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final IconData suffixIcon;
  final bool obscureText;
  final bool prefixIcon;
  final Color suffixIconColor;
  void Function(String)? onChanged;
  FormFieldValidator<String> nameValidator;
   TextFieldAuth({super.key,required this.hintText,required this.textEditingController,required this.suffixIcon,required this.obscureText,required this.prefixIcon,required this.suffixIconColor,required this.onChanged,required this.nameValidator});

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  late bool prefixIcon;
  @override
  void initState() {
    // TODO: implement initState
    prefixIcon=widget.prefixIcon;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TextFormField(
    //   controller: _nameController,
    //   decoration: const InputDecoration(labelText: 'Name'),
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Please enter your name';
    //     }
    //     return null;
    //   },
    // ),
    return SizedBox(
      height: ScreenUtilNew.height(60),
      width: double.infinity,
      child: TextFormField(
        validator: widget.nameValidator,
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        style: GoogleFonts.cairo(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        // textDirection: TextDirection.rtl,
        obscureText: prefixIcon,
        obscuringCharacter: "*",
        decoration: InputDecoration(

          suffixIcon:widget.prefixIcon? IconButton(onPressed: (){
            setState(() {
              prefixIcon=!prefixIcon;
            });
          }, icon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.colorPurpleInLogin,)):null,
          filled: true,
          // hintTextDirection: TextDirection.rtl,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.cairo(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          prefixIcon: Icon(widget.suffixIcon,color: widget.suffixIconColor,),
          fillColor: const Color(0XFFEBE9F2),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14.r)
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14.r)
          ),
        ),
      ),
    );
  }
}
