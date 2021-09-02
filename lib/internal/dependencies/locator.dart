
import 'package:bored_flutter_app/data/repository/app_repository.dart';
import 'package:bored_flutter_app/data/repository/prefs_data_repository.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:bored_flutter_app/domain/store/destination/destinations_store.dart';
import 'package:bored_flutter_app/domain/store/favourite/favourite_store.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies(SharedPreferences prefs) async {

  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<Repository>(AppRepository());

  injector.registerSingleton<DestinationsStore>(DestinationsStore());
  injector.registerSingleton<RandomizerStore>(RandomizerStore(injector()));
  injector.registerSingleton<SearchStore>(SearchStore(injector()));
  injector.registerSingleton<FavouritesStore>(FavouritesStore());
  injector.registerSingleton<PrefsDataRepository>(PrefsDataRepository(prefs));
  injector.registerSingleton<SettingsStore>(SettingsStore(injector()));
}
