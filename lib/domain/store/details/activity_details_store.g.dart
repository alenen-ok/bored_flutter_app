// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityDetailsStore on ActivityDetailsStoreBase, Store {
  final _$activityAtom = Atom(name: 'ActivityDetailsStoreBase.activity');

  @override
  Activity? get activity {
    _$activityAtom.reportRead();
    return super.activity;
  }

  @override
  set activity(Activity? value) {
    _$activityAtom.reportWrite(value, super.activity, () {
      super.activity = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'ActivityDetailsStoreBase.isLoading');

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

  final _$getRandomActivityByParamsAsyncAction =
      AsyncAction('ActivityDetailsStoreBase.getRandomActivityByParams');

  @override
  Future<void> getRandomActivityByParams() {
    return _$getRandomActivityByParamsAsyncAction
        .run(() => super.getRandomActivityByParams());
  }

  final _$clearDataAsyncAction =
      AsyncAction('ActivityDetailsStoreBase.clearData');

  @override
  Future<void> clearData() {
    return _$clearDataAsyncAction.run(() => super.clearData());
  }

  final _$ActivityDetailsStoreBaseActionController =
      ActionController(name: 'ActivityDetailsStoreBase');

  @override
  void goBack() {
    final _$actionInfo = _$ActivityDetailsStoreBaseActionController.startAction(
        name: 'ActivityDetailsStoreBase.goBack');
    try {
      return super.goBack();
    } finally {
      _$ActivityDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activity: ${activity},
isLoading: ${isLoading}
    ''';
  }
}
