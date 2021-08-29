
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/activity_repository.dart';
import 'package:mobx/mobx.dart';

part 'randomizer_store.g.dart';

class RandomizerStore = RandomizerStoreBase with _$RandomizerStore;

abstract class RandomizerStoreBase with Store {
  RandomizerStoreBase(this._activityRepository);

  final ActivityRepository _activityRepository;

  @observable
  Activity? activity;

  @observable
  bool isLoading = false;

  @action
  Future<void> getRandomActivity() async {
    isLoading = true;
    final data = await _activityRepository.getRandomActivity();
    activity = data;
    isLoading = false;
  }
}