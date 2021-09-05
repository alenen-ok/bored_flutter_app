// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavouritesStore on FavouritesStoreBase, Store {
  final _$likedActivitiesAtom =
      Atom(name: 'FavouritesStoreBase.likedActivities');

  @override
  List<Activity> get likedActivities {
    _$likedActivitiesAtom.reportRead();
    return super.likedActivities;
  }

  @override
  set likedActivities(List<Activity> value) {
    _$likedActivitiesAtom.reportWrite(value, super.likedActivities, () {
      super.likedActivities = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'FavouritesStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getActivitiesAsyncAction =
      AsyncAction('FavouritesStoreBase.getActivities');

  @override
  Future<void> getActivities() {
    return _$getActivitiesAsyncAction.run(() => super.getActivities());
  }

  @override
  String toString() {
    return '''
likedActivities: ${likedActivities},
isLoading: ${isLoading}
    ''';
  }
}
