import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghala_new_app/core/utils/app_colors.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';
import 'package:ghala_new_app/core/utils/context_extension.dart';
import 'package:ghala_new_app/features/home_screen/events/presentation/widgets/search_widget_items.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/screen_util_new.dart';

class SearchInEventScreen extends StatefulWidget {
  const SearchInEventScreen({super.key});

  @override
  State<SearchInEventScreen> createState() => _SearchInEventScreenState();
}

class _SearchInEventScreenState extends State<SearchInEventScreen> {
  late TextEditingController _searchController;
  List<String> imagesPath = [
    AssetsManger.bestAgency1,
    AssetsManger.bestAgency2,
    AssetsManger.bestAgency3,
    AssetsManger.bestAgency1
  ];
  List<String> strings = [
    "فوت مش هتموت ",
    "السلاطين",
    "قعدة ام اسماعيل",
    "برتقالة سورية الأصل",
  ];

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtilNew.height(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    context.localizations.searchRoomScreenText1,
                    style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: ScreenUtilNew.width(280),
                  height: ScreenUtilNew.height(52),
                  child: TextField(
                    controller: _searchController,
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.sp),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0XFFF4F2F6),
                      hintStyle: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0XFF9E9999),
                      ),
                      hintText: context.localizations.searchRoomScreenText2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ScreenUtilNew.height(16),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
              child: Text(
                context.localizations.searchRoomScreenText3,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtilNew.height(16),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return SearchWidgetItems(
                      imagePath: imagesPath[index], title: strings[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
