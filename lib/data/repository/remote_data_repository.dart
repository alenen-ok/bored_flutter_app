
import 'package:bored_flutter_app/data/remote/request/get_activity_body.dart';
import 'package:bored_flutter_app/data/remote/service/activity_service.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/data/mapper/activity_mapper.dart';

class RemoteDataRepository {
  RemoteDataRepository(this._activityService);

  final ActivityService _activityService;

  Future<Activity> getRandomActivity() async {
    final response = await _activityService.getRandomActivity();
    return response.toModel();
  }

  Future<Activity> getRandomActivityByParams(ActivityParameters parameters) async {
    final body = GetRandomActivityWithParamsBody(parameters);
    final response = await _activityService.getRandomActivityByParams(body);
    return response.toModel();
  }
}