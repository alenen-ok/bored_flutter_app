
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/activity_repository.dart';
import 'package:bored_flutter_app/domain/service/navigation_service.dart';
import 'package:bored_flutter_app/internal/dependencies/navigation_module.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  SearchStoreBase(this._activityRepository);

  final ActivityRepository _activityRepository;

  final NavigationService _navigationService = NavigationModule.navigationService();

  @observable
  ActivityParameters? params;

  @observable
  Activity? activity;

  @observable
  bool isLoading = false;

  @action
  void setParams({
    ActivityType? type,
    GroupType? groupType,
    CostType? costType,
    AccessibilityType? accessibilityType
  }) {
    final parameters = ActivityParameters(
        type: type,
        participants: groupType,
        price: costType,
        accessibility: accessibilityType
    );
    params = parameters;
    getRandomActivityByParams();
  }

  @action
  Future<void> getRandomActivityByParams() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 600));
    final data = await _activityRepository.getRandomActivityByParams(params ?? ActivityParameters());
    activity = data;
    isLoading = false;
  }

  @action
  Future<void> clearData() async {
    activity = null;
  }

  @action
  void navigateToDetails() {
    _navigationService.navigateTo("activity_details_screen");
  }

  @action
  void goBack() {
    _navigationService.goBack();
  }


}