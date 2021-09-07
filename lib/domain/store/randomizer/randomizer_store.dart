import 'dart:io';

import 'package:bored_flutter_app/core/constant/enum.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:bored_flutter_app/domain/state/activity_state.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'randomizer_store.g.dart';

class RandomizerStore = RandomizerStoreBase with _$RandomizerStore;

abstract class RandomizerStoreBase with Store {
  RandomizerStoreBase(this._activityRepository) {
    print("RandomizerStoreBase constructor");
  }

  final Repository _activityRepository;

  @observable
  ActivityState activityState = ActivityState.init();

  @action
  getRandomActivity() async {
    activityState = ActivityState.loading();
    await Future.delayed(const Duration(milliseconds: 600));
    try {
      final data = await _activityRepository.getRandomActivity();
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
  refreshActivity() async {
    if (activityState is ActivityStateLoaded) {
      if ((activityState as ActivityStateLoaded).activity != null) {
        final data = await _activityRepository
            .refreshActivity((activityState as ActivityStateLoaded).activity!);
        activityState = ActivityState.loaded(data);
      }
    }
  }
}
