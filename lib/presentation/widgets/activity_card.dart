
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityAnimatedCard extends StatelessWidget {
  const ActivityAnimatedCard(this.activity, this.isLoading);

  final Activity? activity;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600),
      child: activity != null && !isLoading?
        ActivityCard(activity!)
            : SizedBox(),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard(this.activity);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsStore>( builder: (ctx, store, _) =>
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: store.useDarkMode! ? activity.activityTypeColor.withOpacity(0.3)
                : activity.activityTypeColor.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: activity.activityTypeColor.withOpacity(0.2),
                blurRadius: 15,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              Text(activity.activity, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
        ),
      ),
    );
  }
  
}
