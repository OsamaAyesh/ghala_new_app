import 'package:flutter/material.dart';
import 'package:ghala_new_app/core/utils/assets_manger.dart';

import '../../../../core/utils/screen_util_new.dart';
class ImageBackground extends StatelessWidget {
  const ImageBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        AssetsManger.backgroundUpScreens,
        height: ScreenUtilNew.height(100),
        width: ScreenUtilNew.width(375),
        fit: BoxFit.contain,
      ),
    );
  }
}
