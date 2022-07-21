import 'package:flutter/material.dart';
import 'package:natie_portfolio/global/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String theme = 'theme';
  static const String language = 'language';

  static SharedPreferences? _prefs;

  static Future<SharedPreferences> get instance async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<ThemeMode> getTheme() async {
    final prefs = await instance;
    final t = prefs.getString(theme) ?? ThemeMode.system.name;
    return ThemeMode.values.firstWhere((tm) => tm.name == t);
  }

  static Future<bool> setTheme(ThemeMode theme) async {
    final prefs = await instance;
    return prefs.setString(SharedPref.theme, theme.name);
  }

  static Future<Language> getLanguage() async {
    final prefs = await instance;
    final l = prefs.getString(language) ?? Language.system.name;
    return Language.values.firstWhere((ln) => ln.name == l);
  }

  static Future<bool> setLanguage(Language language) async {
    final prefs = await instance;
    return prefs.setString(SharedPref.language, language.name);
  }
}