
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/presentation/widgets/stars_indicator.dart';
import 'package:flutter/material.dart';

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
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(activity.activity, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 16.0,),
              Row(
                children: [
                  Text("Type:", style: Theme.of(context).textTheme.subtitle2,),
                  Expanded(child: Text(stringFromActivityType(activity.activityType),
                    textAlign: TextAlign.end, style: Theme.of(context).textTheme.subtitle1,)),
                ],
              ),
              SizedBox(height: 16.0,),
              Row(
                children: [
                  Text("Participants:", style: Theme.of(context).textTheme.subtitle2,),
                  Expanded(child: Text(activity.participantsCount.toString(),
                    textAlign: TextAlign.end, style: Theme.of(context).textTheme.subtitle1,)),
                ],
              ),
              SizedBox(height: 16.0,),
              Text("Price:", style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 16.0,),
              StarsIndicator(activity.price),
              SizedBox(height: 16.0,),
              Text("Accessibility:", style: Theme.of(context).textTheme.subtitle2,),
              SizedBox(height: 16.0,),
              StarsIndicator(activity.accessibility),
            ],
          ),
      ),
    );
  }
  
}
