import 'package:bored_flutter_app/constant/color.dart';
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/data/remote/model/activity_dto.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:flutter/material.dart';

extension ActivityMapper on ActivityDto {
  Activity toModel() => Activity(
      activity: activity,
      activityType: activityTypeFromString(type),
      participantsCount: participants,
      accessibility: accessibility,
      price: price,
      key: int.parse(key));
}

extension ActivityTypeMapper on ActivityType {
  String toStringName() => stringFromActivityType(this);
}

String stringFromActivityType(ActivityType type) {
  switch (type) {
    case ActivityType.recreational:
      return "recreational";
    case ActivityType.cooking:
      return "cooking";
    case ActivityType.education:
      return "education";
    case ActivityType.relaxation:
      return "relaxation";
    case ActivityType.social:
      return "social";
    case ActivityType.charity:
      return "charity";
    case ActivityType.music:
      return "music";
    case ActivityType.busywork:
      return "busywork";
    case ActivityType.diy:
      return "diy";
  }
}

ActivityType activityTypeFromString(String type) {
  switch (type) {
    case "recreational":
      return ActivityType.recreational;
    case "cooking":
      return ActivityType.cooking;
    case "education":
      return ActivityType.education;
    case "relaxation":
      return ActivityType.relaxation;
    case "social":
      return ActivityType.social;
    case "charity":
      return ActivityType.charity;
    case "music":
      return ActivityType.music;
    case "busywork":
      return ActivityType.busywork;
    case "diy":
      return ActivityType.diy;
    default:
      return ActivityType.social;
  }
}

Color activityLightColorFromType(ActivityType type) {
  switch(type) {
    case ActivityType.recreational:
      return AppColors.recreationalColor;
    case ActivityType.cooking:
      return AppColors.cookingColor;
    case ActivityType.education:
      return AppColors.educationColor;
    case ActivityType.relaxation:
      return AppColors.relaxationColor;
    case ActivityType.social:
      return AppColors.socialColor;
    case ActivityType.charity:
      return AppColors.charityColor;
    case ActivityType.music:
      return AppColors.musicColor;
    case ActivityType.busywork:
      return AppColors.busyworkColor;
    case ActivityType.diy:
      return AppColors.diyColor;
  }
}