
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/presentation/widgets/activity_card.dart';
import 'package:bored_flutter_app/presentation/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView(this.store, {required Key key}) : super(key: key);

  final SearchStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return Padding(
            key: Keys.activityDetailsPageKey,
            padding: const EdgeInsets.all(24.0,),
            child: Column(
              children: [

                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Your activity",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (store.isLoading)
                        Center(child: CircularProgressIndicator()),
                      ActivityAnimatedCard(store.activity, store.isLoading),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SimpleIconButton(
                              onTap: () => store.goBack(),
                              icon: Icons.arrow_back_rounded
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("GO BACK"),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SimpleIconButton(
                            onTap: store.isLoading ? null : () => store.getRandomActivityByParams(),
                            icon: Icons.refresh,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("REFRESH"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}