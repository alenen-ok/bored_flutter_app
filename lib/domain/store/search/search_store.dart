
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:bored_flutter_app/domain/service/navigation_service.dart';
import 'package:bored_flutter_app/internal/dependencies/locator.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  SearchStoreBase(this._activityRepository);
  final Repository _activityRepository;

  final NavigationService _navigationService = injector<NavigationService>();

  @observable
  ActivityParameters params = ActivityParameters();

  @observable
  Activity? activity;

  @observable
  bool isLoading = false;

  void setType(ActivityType? value) {
    params.type = value;
  }

  void setCostType(CostType? value) {
    params.price = value;
  }

  void setGroupType(GroupType? value) {
    params.participants = value;
  }

  void setAccessibilityType(AccessibilityType? value) {
    params.accessibility = value;
  }

  @action
  Future<void> getRandomActivityByParams() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 600));
    final data = await _activityRepository.getRandomActivityByParams(params);
    activity = data;
    isLoading = false;
  }

  @action
  Future<void> onLikeActivity() async {
    if (activity != null) {
      if (activity!.isLiked) {
        await _activityRepository.removeActivityFromLiked(activity!);
      } else {
        await _activityRepository.addActivityToLiked(activity!);
      }
    }
    activity = activity?.copyWith(newIsLiked: !(activity?.isLiked ?? false));
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