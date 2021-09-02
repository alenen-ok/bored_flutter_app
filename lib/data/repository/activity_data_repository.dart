
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/data/source/remote/request/get_activity_body.dart';
import 'package:bored_flutter_app/data/source/remote/service/activity_service.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/activity_repository.dart';
import 'package:bored_flutter_app/data/mapper/activity_mapper.dart';

class ActivityDataRepository extends ActivityRepository{
  ActivityDataRepository(this._activityService);

  final ActivityService _activityService;

  @override
  Future<Activity> getRandomActivity() async {
    final response = await _activityService.getRandomActivity();
    return response.toModel();
  }

  @override
  Future<Activity> getRandomActivityByParams(ActivityParameters parameters) async {
    final body = GetRandomActivityWithParamsBody(parameters);
    final response = await _activityService.getRandomActivityByParams(body);
    return response.toModel();
  }
}