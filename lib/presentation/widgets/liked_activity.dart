import 'package:bored_flutter_app/constant/color.dart';
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LikedActivity extends StatelessWidget {
  const LikedActivity({required this.activity, required this.onRemove, required this.controller});

  final Activity activity;
  final VoidCallback onRemove;
  final SlidableController controller;

  @override
  Widget build(BuildContext context) {
    var _slideActions = [
      SlideAction(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(25), bottomEnd: Radius.circular(25)),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/trash.png",
                width: 24.0,
                height: 24.0,
                color: Theme.of(context).primaryColorDark,
              ), SizedBox(height: 8,),
              Text("Remove")
            ],
          ),
        ),
        onTap: () {
          onRemove.call();
        },
      ),
    ];

    return Slidable(
      key: Key(activity.key.toString()),
      actionPane: SlidableScrollActionPane(),
      controller: controller,
      secondaryActions: _slideActions,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: activity.activityTypeColor,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: activity.activityTypeColor.withOpacity(0.2),
              blurRadius: 15,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
              color: activity.activityTypeColor,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Type: ${stringFromActivityType(activity.activityType)}",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      activity.activity,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.0,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Column(
                  children: [
                    Text(
                      activity.participantsCount.toString(),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.white),
                    ),
                    Text("Mates", style: TextStyle(color: AppColors.white),)
                  ],
                ),
              )
            ])),
      ),
    );
  }
}
