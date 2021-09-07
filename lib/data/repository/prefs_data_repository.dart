
import 'package:shared_preferences/shared_preferences.dart';

const String DARK_MODE_KEY = 'useDarkMode';
const String FIRST_ENTRY_KEY = 'firstEntry';

class PrefsDataRepository {
  PrefsDataRepository(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;


  setDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(DARK_MODE_KEY, useDarkMode);
  }

  bool useDarkMode() => _sharedPreferences.getBool(DARK_MODE_KEY) ?? false;

  setFirstEntry(bool firstEntry) {
    _sharedPreferences.setBool(FIRST_ENTRY_KEY, firstEntry);
  }

  bool isFirstEntry() => _sharedPreferences.getBool(FIRST_ENTRY_KEY) ?? true;
  
}