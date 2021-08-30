
import 'package:bored_flutter_app/domain/model/activity.dart';

abstract class ActivityRepository {
  Future<Activity> getRandomActivity();
  Future<Activity> getRandomActivityByParams();
}