
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';

class AppRepository implements Repository {

  @override
  Future<Activity> getRandomActivity() {
    // TODO: implement getRandomActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> getRandomActivityByParams(ActivityParameters parameters) {
    // TODO: implement getRandomActivityByParams
    throw UnimplementedError();
  }

  @override
  setDarkMode(bool useDarkMode) {
    // TODO: implement setDarkMode
    throw UnimplementedError();
  }

  @override
  bool useDarkMode() {
    return true;
  }

}