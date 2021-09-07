
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/state/activity_state.dart';
import 'package:bored_flutter_app/presentation/widgets/stars_indicator.dart';
import 'package:flutter/material.dart';

import 'activity_error_card.dart';
import 'activity_not_found_card.dart';

class ActivityAnimatedCard extends StatelessWidget {
  const ActivityAnimatedCard(
      {required this.activityState, required this.onLike});

  final ActivityState activityState;
  final VoidCallback onLike;

  Widget _widget() {
    switch(activityState.runtimeType) {
      case ActivityStateLoading:
        return SizedBox();
      case ActivityStateLoaded:
        final activity = (activityState as ActivityStateLoaded).activity;
        if (activity != null) {
          return ActivityCard(activity, onLike);
        } else {
          return ActivityNotFoundCard();
        }
      case ActivityStateError:
        return ErrorActivityCard((activityState as ActivityStateError).errorMessage);
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600),
      child: _widget()
    );
  }
}


class ActivityCard extends StatelessWidget {
  const ActivityCard(this.activity, this.onLike);

  final Activity activity;
  final VoidCallback onLike;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return false;
      },
      child: IntrinsicHeight(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: activity.activityTypeColor.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: activity.activityTypeColor.withOpacity(0.2),
                blurRadius: 15,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: onLike,
                        icon: Image.asset(
                          activity.isLiked
                              ? "assets/images/like.png"
                              : "assets/images/heart.png",
                          height: 20.0,
                          color: Theme.of(context).primaryColorDark,
                        ))),
                Text(
                  activity.activity,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Text(
                      "Type:",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Expanded(
                        child: Text(
                      stringFromActivityType(activity.activityType),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Text(
                      "Participants:",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Expanded(
                        child: Text(
                      activity.participantsCount.toString(),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Price:",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 16.0,
                ),
                StarsIndicator(activity.price),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Accessibility:",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 16.0,
                ),
                StarsIndicator(activity.accessibility),
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
