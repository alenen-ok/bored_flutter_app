
import 'package:bored_flutter_app/data/remote/model/activity_dto.dart';
import 'package:dio/dio.dart';

class ActivityService {
  static const _BASE_URL = 'https://www.boredapi.com/api/activity/';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _BASE_URL,
    ),
  );

  Future<ActivityDto> getRandomActivity() async {
    final response = await _dio.get('');
    return ActivityDto.fromApi(response.data);
  }
}