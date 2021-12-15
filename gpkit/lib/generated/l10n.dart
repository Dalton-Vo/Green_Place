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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Counter App`
  String get appTitle {
    return Intl.message(
      'Counter App',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Counter App - Home Page`
  String get pageTitle {
    return Intl.message(
      'Counter App - Home Page',
      name: 'pageTitle',
      desc: '',
      args: [],
    );
  }

  /// `{counter, plural, zero{You have never pushed this button} one{You have pushed this button 1 time} other{}}`
  String counterText(num counter) {
    return Intl.plural(
      counter,
      zero: 'You have never pushed this button',
      one: 'You have pushed this button 1 time',
      other: '',
      name: 'counterText',
      desc: '',
      args: [counter],
    );
  }

  /// `Click me please:`
  String get clickme {
    return Intl.message(
      'Click me please:',
      name: 'clickme',
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
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
      Locale.fromSubtags(languageCode: 'hi', countryCode: 'HI'),
      Locale.fromSubtags(languageCode: 'jp', countryCode: 'JP'),
      Locale.fromSubtags(languageCode: 'vi', countryCode: 'VI'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}