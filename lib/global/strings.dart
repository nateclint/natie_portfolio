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
      case Language.en:
      case Language.vi:
        return languageStore.activeLanguage;
    }
  }

  static const titleEn = 'Gia Hưng - Mobile Developer';
  static const titleVi = 'Gia Hưng - Lập trình viên di động';
}