
import 'package:bored_flutter_app/data/remote/service/activity_service.dart';
import 'package:bored_flutter_app/data/repository/activity_data_repository.dart';
import 'package:bored_flutter_app/domain/repository/activity_repository.dart';

class RepositoryModule {
  static ActivityRepository? _activityRepository;

  static ActivityRepository activityRepository() {
    if (_activityRepository == null) {
      _activityRepository = ActivityDataRepository(
        ActivityService()
      );
    }
    return _activityRepository!;
  }
}