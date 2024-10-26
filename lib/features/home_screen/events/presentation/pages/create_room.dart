import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/core/utils/screen_util_new.dart';
import 'package:ghala_new_app/features/auth/presentation/widgets/image_background.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manger.dart';
import '../widgets/text_filed_custom.dart';
import '../widgets/types_rooms_widget.dart';

class CreateRoom extends StatefulWidget {
  CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  bool typeNum1 = true;

  bool typeNum2 = false;

  bool typeNum3 = false;

  bool typeNum4 = false;

  String typeOfRoom = "الغناء";
  String countryValue = "palestine";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  String countryName = '';
  String countryFlag = '';
  late TextEditingController nameRoomTextEditingController;
  late TextEditingController descriptionTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    nameRoomTextEditingController = TextEditingController();
    descriptionTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameRoomTextEditingController.dispose();
    descriptionTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> allowedToWrite = [
      context.localizations.createRoomsScreenText15,
      context.localizations.createRoomsScreenText16,
      context.localizations.createRoomsScreenText17,
      context.localizations.createRoomsScreenText18
      ,
    ];
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
            Icons.arrow_back_ios_new,
            color: AppColors.colorPurpleInLogin,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          context.localizations.createRoomsScreenText1,
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
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: ScreenUtilNew.height(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: ScreenUtilNew.height(120),
                        width: ScreenUtilNew.width(120),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colorPurpleInLogin),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(right: ScreenUtilNew.width(8)),
                              child: Image.asset(
                                AssetsManger.logoPurpleSecondaryInCreateRoom,
                                height: ScreenUtilNew.height(51),
                                width: ScreenUtilNew.height(39),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              height: ScreenUtilNew.height(25),
                              width: ScreenUtilNew.width(34),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.colorPurpleSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(32),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtilNew.height(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.gamepad_outlined,
                            color: AppColors.colorPurpleInLogin,
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(4),
                          ),
                          Text(
                             context.localizations.createRoomsScreenText2,
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: AppColors.colorPurpleInLogin),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              typeNum4 = true;
                              typeNum3 = false;
                              typeNum2 = false;
                              typeNum1 = false;
                              typeOfRoom = context.localizations.createRoomsScreenText6;
                              print(typeOfRoom);
                            });
                          },
                          child: SizedBox(
                            height: ScreenUtilNew.height(140),
                            width: ScreenUtilNew.width(78),
                            child: Stack(
                              children: [
                                Center(
                                  child: TypesRoomsWidget(
                                    imagePath: AssetsManger.typeRoomImage4,
                                    nameTypeRoom: context.localizations.createRoomsScreenText6,
                                    height: ScreenUtilNew.height(42),
                                    width: ScreenUtilNew.width(50),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0XFFE1797A),
                                        Color(0XFFE04C84),
                                      ],
                                    ),
                                  ),
                                ),
                                typeNum4
                                    ? Padding(
                                  padding:  EdgeInsets.only(bottom: ScreenUtilNew.height(45),right:ScreenUtilNew.height(8)),
                                  child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: ScreenUtilNew.height(24),
                                            width: ScreenUtilNew.width(24),
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    ScreenUtilNew.width(4),
                                                vertical:
                                                    ScreenUtilNew.height(4)),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.colorPurpleInLogin,
                                            ),
                                            child: const Align(
                                              child: Icon(
                                                Icons.done,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: ScreenUtilNew.height(24),
                                        width: ScreenUtilNew.width(24),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              typeNum4 = false;
                              typeNum3 = true;
                              typeNum2 = false;
                              typeNum1 = false;
                              typeOfRoom = context.localizations.createRoomsScreenText5;
                              print(typeOfRoom);
                            });
                          },
                          child: SizedBox(
                            height: ScreenUtilNew.height(140),
                            width: ScreenUtilNew.width(78),
                            child: Stack(
                              children: [
                                Center(
                                  child: TypesRoomsWidget(
                                    imagePath:
                                        AssetsManger.typeRoomImage3,
                                    nameTypeRoom: context.localizations.createRoomsScreenText5,
                                    height: ScreenUtilNew.height(54),
                                    width:ScreenUtilNew.width(57),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0XFF5B35B1),
                                        Color(0XFF3DD2DA),
                                      ],
                                    ),
                                  ),
                                ),
                                typeNum3
                                    ? Padding(
                                  padding:  EdgeInsets.only(bottom: ScreenUtilNew.height(45),right:ScreenUtilNew.height(8)),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: ScreenUtilNew.height(24),
                                            width: ScreenUtilNew.width(24),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.colorPurpleInLogin,
                                            ),
                                            child: const Align(
                                                child: Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 16,
                                            )),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height:ScreenUtilNew.height(24),
                                        width: ScreenUtilNew.width(24),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              typeNum4 = false;
                              typeNum3 = false;
                              typeNum2 = true;
                              typeNum1 = false;
                              typeOfRoom = context.localizations.createRoomsScreenText4;
                              print(typeOfRoom);
                            });
                          },
                          child: SizedBox(
                            height: ScreenUtilNew.height(140),
                            width: ScreenUtilNew.width(78),
                            child: Stack(
                              children: [
                                Center(
                                  child: TypesRoomsWidget(
                                    imagePath:
                                        AssetsManger.typeRoomImage2,
                                    nameTypeRoom: context.localizations.createRoomsScreenText4,
                                    height: ScreenUtilNew.height(37),
                                    width: ScreenUtilNew.width(44),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0XFFD169D3),
                                        Color(0XFFEEC789),
                                      ],
                                    ),
                                  ),
                                ),
                                typeNum2
                                    ? Padding(
                                  padding:  EdgeInsets.only(bottom: ScreenUtilNew.height(45),right:ScreenUtilNew.height(8)),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: ScreenUtilNew.height(24),
                                            width: ScreenUtilNew.height(24),
              
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.colorPurpleInLogin,
                                            ),
                                            child: const Align(
                                                child: Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 16,
                                            )),
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: ScreenUtilNew.height(24),
                                        width: ScreenUtilNew.width(24),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              typeNum4 = false;
                              typeNum3 = false;
                              typeNum2 = false;
                              typeNum1 = true;
                              typeOfRoom = context.localizations.createRoomsScreenText3;
                              print(typeOfRoom);
                            });
                          },
                          child: SizedBox(
                            height: ScreenUtilNew.height(140),
                            width: ScreenUtilNew.width(78),
                            child: Stack(
                              children: [
                                Center(
                                  child: TypesRoomsWidget(
                                    imagePath:
                                        AssetsManger.typeRoomImage1,
                                    nameTypeRoom: context.localizations.createRoomsScreenText3,
                                    height: ScreenUtilNew.height(65),
                                    width: ScreenUtilNew.width(54),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0XFFF98367),
                                        Color(0XFFF7C9DC),
                                      ],
                                    ),
                                  ),
                                ),
                                typeNum1
                                    ? Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding:  EdgeInsets.only(bottom: ScreenUtilNew.height(45),right:ScreenUtilNew.height(8)),
                                        child: Container(
                                          height: ScreenUtilNew.height(24),
                                          width: ScreenUtilNew.width(24),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.colorPurpleInLogin,
                                          ),
                                          child: const Align(
                                              child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 16,
                                          )),
                                        ),
                                      ),
                                    )
                                    : SizedBox(
                                        height: ScreenUtilNew.height(24),
                                        width: ScreenUtilNew.width(24),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(32),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.public_outlined,
                            color: AppColors.colorPurpleInLogin,
                          ),
                          Text(
                            context.localizations.createRoomsScreenText7,
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: AppColors.colorPurpleInLogin
                            ),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            context.localizations.createRoomsScreenText8,
                            style: GoogleFonts.cairo(
                                color: const Color(0XFFA89E9E),
                                fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtilNew.width(8), vertical: ScreenUtilNew.height(8)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: AppColors.colorPurpleSecondary,
                            ),
                            child: Text(
                              countryValue,
                              style: GoogleFonts.cairo(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.colorPurpleInLogin),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(16),
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(40),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: CSCPicker(
                                showCities: false,
                                showStates: false,
                                onCountryChanged: (value) {
                                  setState(() {
                                    countryValue = value;
                                    print(countryValue);
                                  });
                                },
                                onStateChanged: (value) {
                                  setState(() {
                                    // stateValue = value;
                                  });
                                },
                                onCityChanged: (value) {
                                  setState(() {
                                    // cityValue = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.meeting_room_outlined,
                            color: AppColors.colorPurpleInLogin,
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(4),
                          ),
                          Text(
                            context.localizations.createRoomsScreenText10,
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: AppColors.colorPurpleInLogin),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:ScreenUtilNew.height(8),
                    ),
                    TextFiledCustom(
                      textEditingController: nameRoomTextEditingController,
                      maxLines: 6,
                      minLines: 1,
                      hintText: context.localizations.createRoomsScreenText11,
                    ),
                    SizedBox(
                      height:ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.description_outlined,
                            color: AppColors.colorPurpleInLogin,
                          ),
                          SizedBox(
                            width:ScreenUtilNew.width(4),
                          ),
                          Text(
                            context.localizations.createRoomsScreenText12,
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: AppColors.colorPurpleInLogin),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:ScreenUtilNew.height(8),
                    ),
                    TextFiledCustom(
                      textEditingController: descriptionTextEditingController,
                      maxLines: 6,
                      minLines: 5,
                      hintText: context.localizations.createRoomsScreenText13,
                    ),
                    SizedBox(
                      height:ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.message_outlined,
                            color: AppColors.colorPurpleInLogin,
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(4),
                          ),
                          Text(
                            context.localizations.createRoomsScreenText14,
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: AppColors.colorPurpleInLogin),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtilNew.width(8), vertical: ScreenUtilNew.height(8)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: AppColors.colorPurpleSecondary,
                            ),
                            child: Text(
                              allowedToWrite[0],
                              style: GoogleFonts.cairo(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.colorPurpleInLogin),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(8),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtilNew.width(8), vertical: ScreenUtilNew.height(8)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: AppColors.colorPurpleSecondary,
                            ),
                            child: Text(
                              allowedToWrite[1],
                              style: GoogleFonts.cairo(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.colorPurpleInLogin),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtilNew.width(10),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtilNew.width(8), vertical: ScreenUtilNew.height(8)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.r),
                                color: AppColors.colorPurpleSecondary,
                              ),
                              child: Text(
                                allowedToWrite[2],
                                style: GoogleFonts.cairo(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.colorPurpleInLogin),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtilNew.width(8), vertical: ScreenUtilNew.height(8)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: AppColors.colorPurpleSecondary,
                        ),
                        child: Text(
                          allowedToWrite[3],
                          style: GoogleFonts.cairo(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorPurpleInLogin),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                      child: Text(
                        context.localizations.createRoomsScreenText19,
                        style: GoogleFonts.cairo(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorPurpleInLogin),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtilNew.height(16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
                        child: Container(
                          height: ScreenUtilNew.height(52),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.colorPurpleInLogin,
                              borderRadius: BorderRadius.circular(14.r)),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  context.localizations.createRoomsScreenText20,
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: const Color(0XFFD1C6FF),
                                  ),
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
