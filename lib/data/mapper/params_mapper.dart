

import 'package:bored_flutter_app/constant/enum.dart';

extension ActivityTypeMapper on ActivityType {
  String toStringName() => stringFromActivityType(this);
}

String stringFromActivityType(ActivityType type) {
  switch (type) {
    case ActivityType.recreational:
      return "Recreational";
    case ActivityType.cooking:
      return "Cooking";
    case ActivityType.education:
      return "Education";
    case ActivityType.relaxation:
      return "Relaxation";
    case ActivityType.social:
      return "Social";
    case ActivityType.charity:
      return "Charity";
    case ActivityType.music:
      return "Music";
    case ActivityType.busywork:
      return "Busywork";
    case ActivityType.diy:
      return "Diy";
  }
}

ActivityType? activityTypeFromString(String type) {
  switch (type.toLowerCase()) {
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
      return null;
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
  switch(costType.toLowerCase()) {
    case "free":
      return CostType.free;
    case "cheap":
      return CostType.cheap;
    case "medium":
      return CostType.medium;
    case "expensive":
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