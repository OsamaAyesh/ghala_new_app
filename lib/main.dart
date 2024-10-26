import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghala_new_app/state_management/chnage_language_controller.dart';

import 'core/services/shared_pref_controller.dart';
import 'features/auth/presentation/manager/providers/terms_and_condition_controller.dart';
import 'ghala_new_app.dart';
import 'package:provider/provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // قفل التوجيه على الوضع العمودي
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await SharedPrefController().initPreferences();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TermsAndConditionController()),
        ChangeNotifierProvider(create: (_)=> ChangeLanguage()),
      ],
      child:  GhalaNewApp(), // Wrap your app with providers
    ),
    // ),
  );
}