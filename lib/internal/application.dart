
import 'package:bored_flutter_app/core/constant/style.dart';
import 'package:bored_flutter_app/core/services/navigation_service.dart';
import 'package:bored_flutter_app/domain/store/destination/destinations_store.dart';
import 'package:bored_flutter_app/domain/store/favourite/favourite_store.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:bored_flutter_app/presentation/screens/activity_details_screen.dart';
import 'package:bored_flutter_app/presentation/screens/home_screen.dart';
import 'package:bored_flutter_app/presentation/screens/welcome_screen.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';

import 'dependencies/locator.dart';

class MyApp extends StatelessWidget {
  const MyApp( {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DestinationsStore>(
          create: (_) => injector<DestinationsStore>(),
        ),
        Provider<RandomizerStore>(
          create: (_) => injector<RandomizerStore>(),
        ),
        Provider<SearchStore>(
          create: (_) => injector<SearchStore>(),
        ),
        Provider<FavouritesStore>(
          create: (_) => injector<FavouritesStore>(),
        ),
        Provider<SettingsStore>(
          create: (_) => injector<SettingsStore>(),
        ),
      ],
      child: Consumer<SettingsStore>(
        builder: (context, setStore, _) {
          return Observer(builder: (_) {
            return MaterialApp(
              navigatorKey: injector<NavigationService>().navigationKey,
              debugShowCheckedModeBanner: false,
              theme: setStore.useDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
              home: setStore.firstEntry ? WelcomeScreen() : HomeScreen(),
              routes: {
                "welcome_screen": (BuildContext context) => WelcomeScreen(),
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