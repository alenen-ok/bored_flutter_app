
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';

abstract class Repository {
  Future<Activity> getRandomActivity();
  Future<Activity> getRandomActivityByParams(ActivityParameters parameters);
  setDarkMode(bool useDarkMode);
  bool useDarkMode();
}