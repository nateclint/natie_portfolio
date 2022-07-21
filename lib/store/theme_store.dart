import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:natie_portfolio/data/shared_pref/shared_pref.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode activeTheme = ThemeMode.system;

  @action
  void getActiveTheme() async => activeTheme = await SharedPref.getTheme();

  @action
  void setActiveTheme(ThemeMode theme) {
    activeTheme = theme;
    SharedPref.setTheme(theme);
  }
}