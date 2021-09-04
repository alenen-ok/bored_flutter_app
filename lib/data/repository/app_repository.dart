
import 'package:bored_flutter_app/data/repository/prefs_data_repository.dart';
import 'package:bored_flutter_app/data/repository/remote_data_repository.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';

class AppRepository implements Repository {

  AppRepository({required this.remoteDataRepository, required this.prefsDataRepository});

  final RemoteDataRepository remoteDataRepository;
  final PrefsDataRepository prefsDataRepository;


  @override
  Future<Activity> getRandomActivity() async {
    return await remoteDataRepository.getRandomActivity();
  }

  @override
  Future<Activity> getRandomActivityByParams(ActivityParameters parameters) async {
    return await remoteDataRepository.getRandomActivityByParams(parameters);
  }

  @override
  setDarkMode(bool useDarkMode) {
    prefsDataRepository.setDarkMode(useDarkMode);
  }

  @override
  bool useDarkMode() {
    return prefsDataRepository.useDarkMode();
  }

}