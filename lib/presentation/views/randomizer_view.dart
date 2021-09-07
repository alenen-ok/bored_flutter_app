
import 'package:bored_flutter_app/core/constant/key.dart';
import 'package:bored_flutter_app/domain/state/activity_state.dart';
import 'package:bored_flutter_app/domain/store/randomizer/randomizer_store.dart';
import 'package:bored_flutter_app/presentation/widgets/activity/activity_card.dart';
import 'package:bored_flutter_app/presentation/widgets/add_refresh_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RandomizerView extends StatelessWidget {
  RandomizerView(this.store, {required Key key}) : super(key: key) {
    store.refreshActivity();
  }

  final RandomizerStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Stack(
            //fit: StackFit.expand,
            children: [
              Column(
                //mainAxisSize: MainAxisSize.min,
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
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        if (store.activityState is ActivityStateLoading)
                          CircularProgressIndicator(),
                        ActivityAnimatedCard(
                          activityState: store.activityState,
                          onLike: store.onLikeActivity,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56.0,
                  )
                ],
              ),
              AnimatedAlign(
                alignment: store.activityState is ActivityStateInit ? Alignment.center : Alignment(0, 1.08),
                duration: Duration(milliseconds: 600),
                child: AddRefreshButton(
                  onTap: store.activityState is ActivityStateLoading ? null
                      : () => store.getRandomActivity(),
                  isActivated: !(store.activityState is ActivityStateInit),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
