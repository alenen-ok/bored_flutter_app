import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:bored_flutter_app/presentation/widgets/activity_card.dart';
import 'package:bored_flutter_app/presentation/widgets/add_refresh_btn.dart';
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
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      "Random activity",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (store.isLoading)
                          Center(child: CircularProgressIndicator()),
                        ActivityAnimatedCard(store.activity, store.isLoading),
                      ],
                    ),
                  )
                ],
              ),
              AnimatedAlign(
                alignment: store.activity == null && !store.isLoading ? Alignment.center : Alignment(0, 1.08),
                duration: Duration(milliseconds: 600),
                child: AddRefreshButton(
                  onTap: store.isLoading ? null : () => store.getRandomActivity(),
                  isActivated: store.activity != null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
