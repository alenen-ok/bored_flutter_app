
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/favourite/favourite_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView(this.store, {required Key key}) : super(key: key);

  final FavouritesStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          key: Keys.favouritesPageKey,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  "Liked activities",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}