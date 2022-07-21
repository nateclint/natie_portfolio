import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:natie_portfolio/global/strings.dart';

part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  @observable
  Language activeLanguage = Language.system;

  @action
  void setActiveLanguage(Language language) => activeLanguage = language;
} 