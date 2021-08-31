
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/data/remote/model/activity_params.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/presentation/widgets/icon_button.dart';
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
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "Find activity by params",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("There are no parameters yet, you will have absolutely random activity..."),
              ),
              SimpleIconButton(
                  onTap: () {
                    store.setParams();
                    store.navigateToDetails();
                  },
                  icon: Icons.arrow_forward_rounded
              ),
            ],
          ),
        );
      },
    );
  }
}