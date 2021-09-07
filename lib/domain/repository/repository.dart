
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';

abstract class Repository {
  Future<Activity?> getRandomActivity();
  Future<Activity?> getRandomActivityByParams(ActivityParameters parameters);
  setDarkMode(bool useDarkMode);
  setFirstEntry(bool firstEntry);
  bool useDarkMode();
  bool isFirstEntry();
  Future<List<Activity>> getAllLikedActivities();
  Future<Activity> refreshActivity(Activity activity);
  Future<void> addActivityToLiked(Activity activity);
  Future<void> removeActivityFromLiked(Activity activity);
}