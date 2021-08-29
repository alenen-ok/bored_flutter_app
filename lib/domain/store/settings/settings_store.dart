import 'package:mobx/mobx.dart';

import 'package:bored_flutter_app/domain/repository/prefs_repository.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {

  SettingsStoreBase(this._prefsRepository) {
    print("SettingsStoreBase constructor");
    useDarkMode = _prefsRepository.useDarkMode();
  }

  PrefsRepository _prefsRepository;

  @observable
  bool? useDarkMode;

  @action
  void setDarkMode(bool updatedDarkModePreference) {
    _prefsRepository.setDarkMode(updatedDarkModePreference);
    useDarkMode = updatedDarkModePreference;
  }
}