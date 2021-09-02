import 'package:bored_flutter_app/constant/color.dart';
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/data/source/remote/model/activity_dto.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:flutter/material.dart';

extension ActivityMapper on ActivityDto {
  Activity toModel() => Activity(
      activity: activity,
      activityType: activityTypeFromString(type)!,
      participantsCount: participants,
      accessibility: accessibility,
      price: price,
      key: int.parse(key),
      link: link
  );
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
