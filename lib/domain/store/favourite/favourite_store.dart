
import 'package:bored_flutter_app/domain/model/activity.dart';
import 'package:bored_flutter_app/domain/repository/repository.dart';
import 'package:bored_flutter_app/presentation/widgets/liked_activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'favourite_store.g.dart';

class FavouritesStore = FavouritesStoreBase with _$FavouritesStore;

abstract class FavouritesStoreBase with Store {
  FavouritesStoreBase(this._activityRepository) {
    print("FavouritesStoreBase constructor");
  }

  final Repository _activityRepository;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @observable
  List<Activity> likedActivities = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> getActivities() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 600));
    final data = await _activityRepository.getAllLikedActivities();
    likedActivities = data;
    isLoading = false;
  }

  @action
  Future<void> removeActivityFromLiked(int index) async {
    await _activityRepository.removeActivityFromLiked(likedActivities[index]);
    final List<Activity> newActivities = [];
    likedActivities.removeAt(index);
    newActivities.addAll(likedActivities);
    likedActivities = newActivities;
  }
}