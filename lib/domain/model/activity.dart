
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/data/mapper/activity_mapper.dart';
import 'package:flutter/material.dart';

class Activity {
  Activity({
    required this.activity,
    required this.activityType,
    required this.participantsCount,
    required this.accessibility,
    required this.price,
    required this.key,
    this.link
  });

  final int key;
  final String activity;
  final ActivityType activityType;
  final int participantsCount;
  final double price;
  final String? link;
  final double accessibility;

  Color get activityTypeColor => activityLightColorFromType(this.activityType);
}