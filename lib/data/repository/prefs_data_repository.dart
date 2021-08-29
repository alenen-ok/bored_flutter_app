
import 'package:bored_flutter_app/domain/repository/prefs_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrefsDataRepository extends PrefsRepository {
  PrefsDataRepository(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  final String _useDarkModeKey = 'useDarkMode';

  @override
  setDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  @override
  bool useDarkMode() => _sharedPreferences.getBool(_useDarkModeKey) ?? false;
  
}