import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/assets_manger.dart';
import '../../../../../core/utils/screen_util_new.dart';

class WalletTypes extends StatelessWidget {
  String balanceWallet;
  LinearGradient linearGradient;
  String pathImage;
  Color colorBalanceWallet;

  WalletTypes(
      {super.key,
      required this.balanceWallet,
      required this.linearGradient,
      required this.pathImage,
      required this.colorBalanceWallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtilNew.height(64),
      width: ScreenUtilNew.width(150),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: linearGradient,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              AssetsManger.walletBackground,
              height: ScreenUtilNew.height(34),
              width: ScreenUtilNew.width(59),
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: ScreenUtilNew.width(4), bottom: ScreenUtilNew.height(4)),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                pathImage,
                height: ScreenUtilNew.height(56),
                width: ScreenUtilNew.width(56),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtilNew.width(8),
                  vertical: ScreenUtilNew.height(4)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Text(
                balanceWallet,
                style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: colorBalanceWallet),
                textDirection: TextDirection.rtl,
              ),
            ),
          )
        ],
      ),
    );
  }
}
