import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/data/remote/model/activity_dto.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';

extension ActivityMapper on ActivityDto {
  Activity toModel() => Activity(
      activity: activity,
      activityType: activityTypeFromString(type),
      participantsCount: participants,
      accessibility: accessibility,
      price: price,
      key: int.parse(key));
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
