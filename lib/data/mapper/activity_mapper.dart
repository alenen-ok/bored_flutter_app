
import 'package:bored_flutter_app/core/constant/color.dart';
import 'package:bored_flutter_app/core/constant/enum.dart';
import 'package:bored_flutter_app/data/local/entity/activity_entity.dart';
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/data/remote/model/activity_dto.dart';
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
      isLiked: false,
      link: link,
  );
}

extension ActivityDatabaseMapper on ActivityEntity {
  Activity toModel() => Activity(
    activity: activity,
    activityType: activityTypeFromString(activityType)!,
    participantsCount: participantsCount,
    accessibility: accessibility,
    price: price,
    key: key,
    isLiked: true,
    link: link,
  );
}

extension ActivityEntityMapper on Activity {
  ActivityEntity toEntity() => ActivityEntity(
    activity: activity,
    activityType: activityType.toStringName(),
    participantsCount: participantsCount,
    accessibility: accessibility,
    price: price,
    key: key,
    link: link,
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
