// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LanguageStore on _LanguageStore, Store {
  late final _$activeLanguageAtom =
      Atom(name: '_LanguageStore.activeLanguage', context: context);

  @override
  Language get activeLanguage {
    _$activeLanguageAtom.reportRead();
    return super.activeLanguage;
  }

  @override
  set activeLanguage(Language value) {
    _$activeLanguageAtom.reportWrite(value, super.activeLanguage, () {
      super.activeLanguage = value;
    });
  }

  late final _$getActiveLanguageAsyncAction =
      AsyncAction('_LanguageStore.getActiveLanguage', context: context);

  @override
  Future<void> getActiveLanguage() {
    return _$getActiveLanguageAsyncAction.run(() => super.getActiveLanguage());
  }

  late final _$setActiveLanguageAsyncAction =
      AsyncAction('_LanguageStore.setActiveLanguage', context: context);

  @override
  Future<void> setActiveLanguage(Language language) {
    return _$setActiveLanguageAsyncAction
        .run(() => super.setActiveLanguage(language));
  }

  @override
  String toString() {
    return '''
activeLanguage: ${activeLanguage}
    ''';
  }
}
