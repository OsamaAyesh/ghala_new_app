import 'package:flutter/material.dart';

class TermsAndConditionController extends ChangeNotifier {
  bool _isAccepted = false;

  // Getter to access the boolean variable
  bool get isAccepted => _isAccepted;

  // Setter to update the boolean variable and notify listeners
  set isAccepted(bool newValue) {
    _isAccepted = newValue;
    notifyListeners(); // Notify listeners when the value changes
  }
}
