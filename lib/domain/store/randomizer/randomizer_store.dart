
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:mobx/mobx.dart';

part 'randomizer_store.g.dart';

class RandomizerStore = RandomizerStoreBase with _$RandomizerStore;

abstract class RandomizerStoreBase with Store {
  RandomizerStoreBase(this._activityRepository);

  final Repository _activityRepository;

  @observable
  Activity? activity;

  @observable
  bool isLoading = false;

  @action
  Future<void> getRandomActivity() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 600));
    final data = await _activityRepository.getRandomActivity();
    activity = data;
    isLoading = false;
  }
}