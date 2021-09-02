

import 'package:bored_flutter_app/constant/enum.dart';

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

ActivityType? activityTypeFromString(String type) {
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
      return null;
  }
}