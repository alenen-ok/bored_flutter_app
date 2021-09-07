import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {

  SettingsStoreBase(this._prefsRepository) {
    print("SettingsStoreBase constructor");
    useDarkMode = _prefsRepository.useDarkMode();
    firstEntry = _prefsRepository.isFirstEntry();
  }

  final Repository _prefsRepository;

  @observable
  bool useDarkMode = false;

  @observable
  bool firstEntry = false;

  @action
  void setDarkMode(bool updatedDarkModePreference) {
    _prefsRepository.setDarkMode(updatedDarkModePreference);
    useDarkMode = updatedDarkModePreference;
  }

  @action
  void setFirstEntry(bool firstEntry) {
    _prefsRepository.setFirstEntry(firstEntry);
    firstEntry = firstEntry;
  }
}