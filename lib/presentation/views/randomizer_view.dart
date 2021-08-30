
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RandomizerView extends StatelessWidget {
  const RandomizerView(this.store, {required Key key}) : super(key: key);

  final RandomizerStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          key: Keys.randomizerPageKey,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "Random activity",
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: store.activity != null ?
                  Center(
                      child: Text(store.activity!.activity)
                    )
                      : Center(
                    child: CircularProgressIndicator(),
                  )
              ),
              ElevatedButton(
                  onPressed: () => store.getRandomActivity(),
                  child: Text("get")),
            ],
          ),
        );
      },
    );
  }
}