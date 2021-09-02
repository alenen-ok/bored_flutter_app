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

int getMinParticipantsFromType(GroupType activityType) {
  switch(activityType) {
    case GroupType.solo:
      return 1;
    case GroupType.small_company:
      return 5;
    case GroupType.big_company:
      return 9;
  }
}

int getMaxParticipantsFromType(GroupType groupType) {
  switch(groupType) {
    case GroupType.solo:
      return 1;
    case GroupType.small_company:
      return 8;
    case GroupType.big_company:
      return 10;
  }
}

String? stringFromCostType(CostType? costType) {
  if (costType == null) return null;
  switch(costType) {
    case CostType.free:
      return "Free";
    case CostType.cheap:
      return "Cheap";
    case CostType.medium:
      return "Medium";
    case CostType.expensive:
      return "Expensive";
  }
}

CostType? costTypeFromString(String? costType) {
  if (costType == null) return null;
  switch(costType) {
    case "Free":
      return CostType.free;
    case "Cheap":
      return CostType.cheap;
    case "Medium":
      return CostType.medium;
    case "Expensive":
      return CostType.expensive;
    default:
      return null;
  }
}

double getMinPriceFromType(CostType costType) {
  switch(costType) {
    case CostType.free:
     return 0.0;
    case CostType.cheap:
      return 0.1;
    case CostType.medium:
      return 0.4;
    case CostType.expensive:
      return 0.8;
  }
}

double getMaxPriceFromType(CostType costType) {
  switch(costType) {
    case CostType.free:
      return 0.0;
    case CostType.cheap:
      return 0.3;
    case CostType.medium:
      return 0.7;
    case CostType.expensive:
      return 1.0;
  }
}

double getMinAccessibilityFromType(AccessibilityType accessibilityType) {
  switch(accessibilityType) {
    case AccessibilityType.novice:
      return 0.0;
    case AccessibilityType.junior:
      return 0.1;
    case AccessibilityType.middle:
      return 0.4;
    case AccessibilityType.senior:
      return 0.8;
  }
}

double getMaxAccessibilityFromType(AccessibilityType accessibilityType) {
  switch(accessibilityType) {
    case AccessibilityType.novice:
      return 0.0;
    case AccessibilityType.junior:
      return 0.3;
    case AccessibilityType.middle:
      return 0.7;
    case AccessibilityType.senior:
      return 0.1;
  }
}