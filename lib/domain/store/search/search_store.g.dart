// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on SearchStoreBase, Store {
  final _$paramsAtom = Atom(name: 'SearchStoreBase.params');

  @override
  ActivityParameters get params {
    _$paramsAtom.reportRead();
    return super.params;
  }

  @override
  set params(ActivityParameters value) {
    _$paramsAtom.reportWrite(value, super.params, () {
      super.params = value;
    });
  }

  final _$activityAtom = Atom(name: 'SearchStoreBase.activity');

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

  final _$isLoadingAtom = Atom(name: 'SearchStoreBase.isLoading');

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
      AsyncAction('SearchStoreBase.getRandomActivityByParams');

  @override
  Future<void> getRandomActivityByParams() {
    return _$getRandomActivityByParamsAsyncAction
        .run(() => super.getRandomActivityByParams());
  }

  final _$onLikeActivityAsyncAction =
      AsyncAction('SearchStoreBase.onLikeActivity');

  @override
  Future<void> onLikeActivity() {
    return _$onLikeActivityAsyncAction.run(() => super.onLikeActivity());
  }

  final _$SearchStoreBaseActionController =
      ActionController(name: 'SearchStoreBase');

  @override
  void navigateToDetails() {
    final _$actionInfo = _$SearchStoreBaseActionController.startAction(
        name: 'SearchStoreBase.navigateToDetails');
    try {
      return super.navigateToDetails();
    } finally {
      _$SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void goBack() {
    final _$actionInfo = _$SearchStoreBaseActionController.startAction(
        name: 'SearchStoreBase.goBack');
    try {
      return super.goBack();
    } finally {
      _$SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
params: ${params},
activity: ${activity},
isLoading: ${isLoading}
    ''';
  }
}
