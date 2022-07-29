// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  late final _$activeThemeAtom =
      Atom(name: '_ThemeStore.activeTheme', context: context);

  @override
  ThemeMode get activeTheme {
    _$activeThemeAtom.reportRead();
    return super.activeTheme;
  }

  @override
  set activeTheme(ThemeMode value) {
    _$activeThemeAtom.reportWrite(value, super.activeTheme, () {
      super.activeTheme = value;
    });
  }

  late final _$getActiveThemeAsyncAction =
      AsyncAction('_ThemeStore.getActiveTheme', context: context);

  @override
  Future<void> getActiveTheme() {
    return _$getActiveThemeAsyncAction.run(() => super.getActiveTheme());
  }

  late final _$setActiveThemeAsyncAction =
      AsyncAction('_ThemeStore.setActiveTheme', context: context);

  @override
  Future<void> setActiveTheme(ThemeMode theme) {
    return _$setActiveThemeAsyncAction.run(() => super.setActiveTheme(theme));
  }

  @override
  String toString() {
    return '''
activeTheme: ${activeTheme}
    ''';
  }
}
