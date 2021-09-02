
import 'package:bored_flutter_app/data/source/remote/model/activity_dto.dart';
import 'package:bored_flutter_app/data/source/remote/request/get_activity_body.dart';
import 'package:dio/dio.dart';

class ActivityService {
  static const _BASE_URL = 'https://www.boredapi.com/api';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _BASE_URL,
    ),
  );

  Future<ActivityDto> getRandomActivity() async {
    final response = await _dio.get('/activity');
    return ActivityDto.fromApi(response.data);
  }

  Future<ActivityDto> getRandomActivityByParams(GetRandomActivityWithParamsBody body) async {
    final response = await _dio.get(
      '/activity',
      queryParameters: body.toApi(),
    );
    return ActivityDto.fromApi(response.data);
  }

}