
import 'package:bored_flutter_app/constant/const.dart';
import 'package:bored_flutter_app/data/local/dbconfig.dart';
import 'package:bored_flutter_app/data/local/service/activity_local_data_service.dart';
import 'package:bored_flutter_app/data/remote/service/activity_service.dart';
import 'package:bored_flutter_app/data/repository/app_repository.dart';
import 'package:bored_flutter_app/data/repository/local_data_repository.dart';
import 'package:bored_flutter_app/data/repository/prefs_data_repository.dart';
import 'package:bored_flutter_app/data/repository/remote_data_repository.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:bored_flutter_app/domain/service/navigation_service.dart';
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

  injector.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: BASE_URL),
  ));

  final sharedPreferences = await SharedPreferences.getInstance();
  final myDatabase = await LocalDatabase().database;

  injector.registerSingleton<Repository>(AppRepository(
      remoteDataRepository: RemoteDataRepository(ActivityService(injector())),
      prefsDataRepository: PrefsDataRepository(sharedPreferences),
      localDataRepository: LocalDataRepository(LocalActivityService(myDatabase))
  ));
  injector.registerSingleton(NavigationService());

  injector.registerSingleton<DestinationsStore>(DestinationsStore());
  injector.registerSingleton<RandomizerStore>(RandomizerStore(injector()));
  injector.registerSingleton<SearchStore>(SearchStore(injector()));
  injector.registerSingleton<FavouritesStore>(FavouritesStore(injector()));
  injector.registerSingleton<SettingsStore>(SettingsStore(injector()));


}
