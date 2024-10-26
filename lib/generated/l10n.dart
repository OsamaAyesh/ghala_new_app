// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Elegant Voice Communication`
  String get on_boarding_hint1_1 {
    return Intl.message(
      'Elegant Voice Communication',
      name: 'on_boarding_hint1_1',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy engaging voice discussions and building new relationships`
  String get on_boarding_hint1_2 {
    return Intl.message(
      'Enjoy engaging voice discussions and building new relationships',
      name: 'on_boarding_hint1_2',
      desc: '',
      args: [],
    );
  }

  /// `Exciting Voice Meetings`
  String get on_boarding_hint2_1 {
    return Intl.message(
      'Exciting Voice Meetings',
      name: 'on_boarding_hint2_1',
      desc: '',
      args: [],
    );
  }

  /// `Our voice rooms bring us together for unique and enjoyable discussion sessions`
  String get on_boarding_hint2_2 {
    return Intl.message(
      'Our voice rooms bring us together for unique and enjoyable discussion sessions',
      name: 'on_boarding_hint2_2',
      desc: '',
      args: [],
    );
  }

  /// `Exploring Voice Dialogues`
  String get on_boarding_hint3_1 {
    return Intl.message(
      'Exploring Voice Dialogues',
      name: 'on_boarding_hint3_1',
      desc: '',
      args: [],
    );
  }

  /// `Join the chat rooms and enjoy dynamic and exciting voice conversations`
  String get on_boarding_hint3_2 {
    return Intl.message(
      'Join the chat rooms and enjoy dynamic and exciting voice conversations',
      name: 'on_boarding_hint3_2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
