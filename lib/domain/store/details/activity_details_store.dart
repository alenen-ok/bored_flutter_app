

import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/activity_repository.dart';
import 'package:bored_flutter_app/domain/service/navigation_service.dart';
import 'package:bored_flutter_app/internal/dependencies/navigation_module.dart';
import 'package:mobx/mobx.dart';

part 'activity_details_store.g.dart';

class ActivityDetailsStore = ActivityDetailsStoreBase with _$ActivityDetailsStore;

abstract class ActivityDetailsStoreBase with Store {
  ActivityDetailsStoreBase(this._activityRepository);
  final NavigationService _navigationService = NavigationModule.navigationService();

  final ActivityRepository _activityRepository;

  @observable
  Activity? activity;

  @observable
  bool isLoading = true;

  @action
  Future<void> getRandomActivityByParams() async {
    isLoading = true;
    final data = await _activityRepository.getRandomActivityByParams();
    activity = data;
    isLoading = false;
  }

  @action
  Future<void> clearData() async {
    activity = null;
    isLoading = false;
  }

  @action
  void goBack() {
    _navigationService.goBack();
  }
}