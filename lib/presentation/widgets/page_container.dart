
import 'package:bored_flutter_app/core/constant/enum.dart';
import 'package:bored_flutter_app/core/constant/key.dart';
import 'package:bored_flutter_app/domain/store/favourite/favourite_store.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';

import 'package:bored_flutter_app/presentation/views/search_view.dart';
import 'package:bored_flutter_app/presentation/views/favourites_view.dart';
import 'package:bored_flutter_app/presentation/views/randomizer_view.dart';
import 'package:bored_flutter_app/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';

class PageContainer extends StatelessWidget {
  const PageContainer(this.destination, {Key? key}) : super(key: key);

  final Destination destination;
  @override
  Widget build(BuildContext context) {
    switch(destination) {
      case Destination.Randomizer:
        return Consumer<RandomizerStore>(
          builder: (_, store, __) =>
              RandomizerView(store, key: Keys.randomizerPageKey),
        );
      case Destination.Search:
        return Consumer<SearchStore>(
          builder: (_, store, __) =>
              SearchView(store, key: Keys.searchPageKey),
        );
      case Destination.Favourites:
        return Consumer<FavouritesStore>(
          builder: (_, store, __) =>
              FavouritesView(store, key: Keys.favouritesPageKey),
        );
      case Destination.Settings:
        return Consumer<SettingsStore>(
          builder: (_, store, __) =>
              SettingsView(store, key: Keys.settingsPageKey),
        );
    }
  }

}