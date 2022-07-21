import 'package:mobx/mobx.dart';
import 'package:natie_portfolio/data/shared_pref/shared_pref.dart';
import 'package:natie_portfolio/global/strings.dart';

part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  @observable
  Language activeLanguage = Language.system;

  @action
  void getActiveLanguage() async =>
      activeLanguage = await SharedPref.getLanguage();

  @action
  void setActiveLanguage(Language language) {
    activeLanguage = language;
    SharedPref.setLanguage(language);
  }
}