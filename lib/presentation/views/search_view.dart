
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchView extends StatelessWidget {
  const SearchView(this.store, {required Key key}) : super(key: key);

  final SearchStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          key: Keys.searchPageKey,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  "Find activity by param",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(onPressed: () => store.navigateToDetails(), child: Text("details"))
            ],
          ),
        );
      },
    );
  }
}