import 'package:flutter/material.dart';
import 'package:natie_portfolio/store/language_store.dart';
import 'package:provider/provider.dart';

enum Language { system, en, vi }

class Strings {
  static BuildContext? _context;

  static void init(BuildContext context) => _context = context;

  static Language get language {
    if (_context == null) return Language.en;
    final languageStore = _context!.read<LanguageStore>();
    switch (languageStore.activeLanguage) {
      case Language.system:
        Locale locale = Localizations.localeOf(_context!);
        return locale.languageCode == Language.en.name
            ? Language.en
            : Language.vi;
      case Language.en:
      case Language.vi:
        return languageStore.activeLanguage;
    }
  }

  static bool get isEn => Strings.language == Language.en;

  static bool get isVi => Strings.language == Language.vi;

  static Locale get locale => Locale(language.name);

  static const titleEn = 'Gia Hưng - Mobile Developer';
  static const titleVi = 'Gia Hưng - Lập trình viên di động';

  static String get title => language == Language.en ? titleEn : titleVi;
}