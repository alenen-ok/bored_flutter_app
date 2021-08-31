
import 'package:bored_flutter_app/constant/style.dart';
import 'package:bored_flutter_app/data/repository/prefs_data_repository.dart';
import 'package:bored_flutter_app/domain/repository/prefs_repository.dart';
import 'package:bored_flutter_app/domain/store/destination/destinations_store.dart';
import 'package:bored_flutter_app/domain/store/favourite/favourite_store.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:bored_flutter_app/internal/dependencies/navigation_module.dart';
import 'package:bored_flutter_app/internal/dependencies/repository_module.dart';
import 'package:bored_flutter_app/presentation/screens/activity_details_screen.dart';
import 'package:bored_flutter_app/presentation/screens/home_screen.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences, {Key? key}) : super(key: key);

  final SharedPreferences sharedPreferences;
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DestinationsStore>(
          create: (_) => DestinationsStore(),
        ),
        Provider<RandomizerStore>(
          create: (_) => RandomizerStore(RepositoryModule.activityRepository()),
        ),
        Provider<SearchStore>(
          create: (_) => SearchStore(RepositoryModule.activityRepository()),
        ),
        Provider<FavouritesStore>(
          create: (_) => FavouritesStore(),
        ),
        Provider<PrefsRepository>(
          create: (_) => PrefsDataRepository(sharedPreferences),
        ),
        ProxyProvider<PrefsRepository, SettingsStore>(
          update: (_, preferencesRepository, __) =>
              SettingsStore(preferencesRepository),
        ),
      ],
      child: Consumer<SettingsStore>(
        builder: (context, setStore, _) {
          return Observer(builder: (_) {
            return MaterialApp(
              navigatorKey: NavigationModule.navigationService().navigationKey,
              debugShowCheckedModeBanner: false,
              theme: setStore.useDarkMode! ? AppThemes.darkTheme : AppThemes.lightTheme,
              home: HomeScreen(),
              routes: {
                "home_screen": (BuildContext context) => HomeScreen(),
                "activity_details_screen": (BuildContext context) => ActivityDetailsScreen(),
              },
            );
          });
        },
      ),
    );
  }
}