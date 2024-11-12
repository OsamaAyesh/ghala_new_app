// import 'package:flutter/material.dart';
// import 'package:ghala_new_app/core/services/shared_pref_controller.dart';
//
// class ChangeLanguage extends ChangeNotifier {
//   String _selectedLanguage = "en"; // اللغة الافتراضية
//
//   // استرجاع اللغة المحفوظة عند البدء
//   ChangeLanguage() {
//     _loadLanguage();
//   }
//
//   // Getter للوصول إلى اللغة المختارة
//   String get selectedLanguage => _selectedLanguage;
//
//   // Setter لتحديث اللغة المختارة وإشعار المستمعين
//   set selectedLanguage(String newValue) {
//     _selectedLanguage = newValue;
//     SharedPrefController().save(_selectedLanguage,_selectedLanguage=="ar"?0:1);
//     notifyListeners(); // إشعار المستمعين عندما تتغير القيمة
//   }
//
//   // تحميل اللغة المحفوظة من SharedPreferences
//   // void _loadLanguage() async {
//   //   String language = await SharedPrefController().getValue(PrefKeys.language.name);
//   //   _selectedLanguage = language;
//   //   notifyListeners(); // إشعار المستمعين عندما يتم تحميل اللغة
//   // }
//   Future<void> _loadLanguage() async {
//     String language = await SharedPrefController().getValue(PrefKeys.language.name);
//     _selectedLanguage = language;
//     notifyListeners(); // إشعار المستمعين عندما يتم تحميل اللغة
//   }
// }
import 'package:flutter/material.dart';
import 'package:ghala_new_app/core/services/shared_pref_controller.dart';

class ChangeLanguage extends ChangeNotifier {
  String _selectedLanguage = "en"; // اللغة الافتراضية

  ChangeLanguage() {
    _loadLanguage();
  }

  String get selectedLanguage => _selectedLanguage;

  set selectedLanguage(String newValue) {
    _selectedLanguage = newValue;
    SharedPrefController().save(_selectedLanguage, _selectedLanguage == "ar" ? 0 : 1);
    notifyListeners(); // إشعار المستمعين عندما تتغير القيمة
  }

  Future<void> _loadLanguage() async {
    String? language = await SharedPrefController().getValue(PrefKeys.language.name);
    _selectedLanguage = language ?? "en"; // استخدام "en" كقيمة افتراضية في حال كانت null
    notifyListeners(); // إشعار المستمعين عندما يتم تحميل اللغة
  }
}
