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

  late final _$_LanguageStoreActionController =
      ActionController(name: '_LanguageStore', context: context);

  @override
  void setActiveLanguage(Language language) {
    final _$actionInfo = _$_LanguageStoreActionController.startAction(
        name: '_LanguageStore.setActiveLanguage');
    try {
      return super.setActiveLanguage(language);
    } finally {
      _$_LanguageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeLanguage: ${activeLanguage}
    ''';
  }
}
