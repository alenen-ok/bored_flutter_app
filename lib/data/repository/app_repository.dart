
import 'package:bored_flutter_app/data/repository/local_data_repository.dart';
import 'package:bored_flutter_app/data/repository/prefs_data_repository.dart';
import 'package:bored_flutter_app/data/repository/remote_data_repository.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';

class AppRepository implements Repository {

  AppRepository({required this.remoteDataRepository,
    required this.prefsDataRepository,
    required this.localDataRepository
  });

  final RemoteDataRepository remoteDataRepository;
  final PrefsDataRepository prefsDataRepository;
  final LocalDataRepository localDataRepository;

  @override
  Future<Activity?> getRandomActivity() async {
    final activity = await remoteDataRepository.getRandomActivity();
    if (activity != null) {
      final isLiked = await localDataRepository.hasActivityByKey(activity.key);
      activity.isLiked = isLiked;
    }
    return activity;
  }

  @override
  Future<Activity?> getRandomActivityByParams(ActivityParameters parameters) async {
    final activity =  await remoteDataRepository.getRandomActivityByParams(parameters);
    if (activity != null) {
      final isLiked = await localDataRepository.hasActivityByKey(activity.key);
      activity.isLiked = isLiked;
    }
    return activity;
  }

  @override
  setDarkMode(bool useDarkMode) {
    prefsDataRepository.setDarkMode(useDarkMode);
  }

  @override
  bool useDarkMode() {
    return prefsDataRepository.useDarkMode();
  }

  @override
  Future<List<Activity>> getAllLikedActivities() {
    return localDataRepository.getAllLikedActivities();
  }

  @override
  Future<void> addActivityToLiked(Activity activity) {
    return localDataRepository.addActivityToLiked(activity);
  }

  @override
  Future<void> removeActivityFromLiked(Activity activity) {
    return localDataRepository.removeActivityByKey(activity.key);
  }

  @override
  Future<Activity> refreshActivity(Activity activity) {
    return localDataRepository.refreshActivity(activity);
  }

  @override
  bool isFirstEntry() {
    return prefsDataRepository.isFirstEntry();
  }

  @override
  setFirstEntry(bool firstEntry) {
    prefsDataRepository.setFirstEntry(firstEntry);
  }

}