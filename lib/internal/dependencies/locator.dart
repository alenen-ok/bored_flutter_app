
import 'package:bored_flutter_app/data/remote/service/activity_service.dart';
import 'package:bored_flutter_app/data/repository/app_repository.dart';
import 'package:bored_flutter_app/data/repository/prefs_data_repository.dart';
import 'package:bored_flutter_app/data/repository/remote_data_repository.dart';
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

Future<void> initializeDependencies() async {

  injector.registerSingleton<Dio>(Dio());

  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerSingleton<Repository>(AppRepository(
      remoteDataRepository: RemoteDataRepository(ActivityService()),
      prefsDataRepository: PrefsDataRepository(sharedPreferences))
  );

  injector.registerSingleton<DestinationsStore>(DestinationsStore());
  injector.registerSingleton<RandomizerStore>(RandomizerStore(injector()));
  injector.registerSingleton<SearchStore>(SearchStore(injector()));
  injector.registerSingleton<FavouritesStore>(FavouritesStore());
  injector.registerSingleton<SettingsStore>(SettingsStore(injector()));
}
