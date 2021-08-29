import 'package:bored_flutter_app/constant/style.dart';
import 'package:bored_flutter_app/data/repository/prefs_data_repository.dart';
import 'package:bored_flutter_app/domain/repository/prefs_repository.dart';
import 'package:bored_flutter_app/domain/store/destination/destinations_store.dart';
import 'package:bored_flutter_app/domain/store/favourite/favourite_store.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:bored_flutter_app/internal/dependencies/repository_module.dart';
import 'package:bored_flutter_app/presentation/widgets/animated_bottom_navigation_bar.dart';
import 'package:bored_flutter_app/presentation/widgets/page_container.dart';
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
          create: (_) => SearchStore(),
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
        builder: (context, store, _) {
          return Observer(builder: (_) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: store.useDarkMode! ? AppThemes.darkTheme : AppThemes.lightTheme,
              home: Consumer<DestinationsStore>(
                builder: (context, store, _) {
                  return Observer(builder: (_) {
                    return Scaffold(
                      body: PageContainer(store.selectedDestination),
                      bottomNavigationBar: AnimatedTabBar(
                        key: const Key('bottomNavigationBar'),
                        onTap: (index) => store.selectDestination(index),
                        currentIndex: store.selectedDestinationIndex,
                      ),
                    );
                  });
                },
              ),
            );
          });
        },
      ),
    );
  }
}