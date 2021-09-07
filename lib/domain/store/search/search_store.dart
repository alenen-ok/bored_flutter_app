
import 'package:bored_flutter_app/core/constant/enum.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:bored_flutter_app/core/services/navigation_service.dart';
import 'package:bored_flutter_app/domain/state/activity_state.dart';
import 'package:bored_flutter_app/internal/dependencies/locator.dart';
import 'package:dio/dio.dart';
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
  ActivityState activityState = ActivityState.init();

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
  getRandomActivityByParams() async {
    activityState = ActivityState.loading();
    await Future.delayed(const Duration(milliseconds: 600));
    try {
      final data = await _activityRepository.getRandomActivityByParams(params);
      activityState = ActivityState.loaded(data);

    } on DioError {
      activityState = ActivityState.error(ErrorType.no_internet_connection);
    } catch (e) {
      print(e.toString());
      activityState = ActivityState.error(ErrorType.something_went_wrong);
    }
  }

  @action
  onLikeActivity() async {
    if (activityState is ActivityStateLoaded) {
      if ((activityState as ActivityStateLoaded).activity != null) {
        final newActivity = (activityState as ActivityStateLoaded).activity!.copyWith();
        if (newActivity.isLiked) {
          await _activityRepository.removeActivityFromLiked(newActivity);
        } else {
          await _activityRepository.addActivityToLiked(newActivity);
        }
        newActivity.isLiked = !newActivity.isLiked;
        activityState = ActivityState.loaded(newActivity);
      }
    }
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