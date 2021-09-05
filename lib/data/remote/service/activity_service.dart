
import 'package:bored_flutter_app/data/remote/model/activity_dto.dart';
import 'package:bored_flutter_app/data/remote/request/get_activity_body.dart';
import 'package:dio/dio.dart';

class ActivityService {
  ActivityService(this.dio);
  final Dio dio;

  Future<ActivityDto> getRandomActivity() async {
    final response = await dio.get('/activity');
    return ActivityDto.fromApi(response.data);
  }

  Future<ActivityDto> getRandomActivityByParams(GetRandomActivityWithParamsBody body) async {
    final response = await dio.get(
      '/activity',
      queryParameters: body.toApi(),
    );
    return ActivityDto.fromApi(response.data);
  }

}