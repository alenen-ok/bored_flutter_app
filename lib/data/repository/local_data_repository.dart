
import 'package:bored_flutter_app/data/local/service/activity_local_data_service.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/data/mapper/activity_mapper.dart';


class LocalDataRepository {
  LocalDataRepository(this.localActivityService);
  final LocalActivityService localActivityService;

  Future<List<Activity>> getAllLikedActivities() async {
    final response = await localActivityService.getAllLikedActivities();
    return response.map((e) => e.toModel()).toList();
  }

  Future<void> addActivityToLiked(Activity activity) async {
    await localActivityService.addActivityToLiked(activity.toEntity());
  }

  Future<void> removeActivityByKey(int key) async {
    await localActivityService.removeActivityByKey(key);
  }

  Future<Activity> refreshActivity(Activity activity) async {
    final response = await localActivityService.getLikedActivitiesByKey(activity.key);
    return activity.copyWith(newIsLiked: response.isNotEmpty);
  }

  Future<bool> hasActivityByKey(int key) async {
    final response = await localActivityService.getLikedActivitiesByKey(key);
    return response.length != 0;
  }
}