import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ghala_new_app/state_management/chnage_language_controller.dart';
// import 'package:flutter_gen'
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';

import 'config/routes/app_routes.dart';
class GhalaNewApp extends StatelessWidget {
  const GhalaNewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return Consumer<ChangeLanguage>(
          builder: (context, languageProvider, child) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale("ar"),
                    Locale("en"),
                  ],
                  locale: Locale(languageProvider.selectedLanguage),
                  builder: DevicePreview.appBuilder,
                  debugShowCheckedModeBanner: false,
                  initialRoute: Routes.initialRoute,
                  routes: routes,
                );
              },
            );
          },
        );
      },
    );
  }
}
