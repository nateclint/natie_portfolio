import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode activeTheme = ThemeMode.system;

  @action
  void setActiveTheme(ThemeMode theme) => activeTheme = theme;
}