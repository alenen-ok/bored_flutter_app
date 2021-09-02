
import 'package:shared_preferences/shared_preferences.dart';


class PrefsDataRepository {
  PrefsDataRepository(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  final String _useDarkModeKey = 'useDarkMode';

  setDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool useDarkMode() => _sharedPreferences.getBool(_useDarkModeKey) ?? false;
  
}