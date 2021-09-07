// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomizer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RandomizerStore on RandomizerStoreBase, Store {
  final _$activityStateAtom = Atom(name: 'RandomizerStoreBase.activityState');

  @override
  ActivityState get activityState {
    _$activityStateAtom.reportRead();
    return super.activityState;
  }

  @override
  set activityState(ActivityState value) {
    _$activityStateAtom.reportWrite(value, super.activityState, () {
      super.activityState = value;
    });
  }

  final _$getRandomActivityAsyncAction =
      AsyncAction('RandomizerStoreBase.getRandomActivity');

  @override
  Future getRandomActivity() {
    return _$getRandomActivityAsyncAction.run(() => super.getRandomActivity());
  }

  final _$onLikeActivityAsyncAction =
      AsyncAction('RandomizerStoreBase.onLikeActivity');

  @override
  Future onLikeActivity() {
    return _$onLikeActivityAsyncAction.run(() => super.onLikeActivity());
  }

  final _$refreshActivityAsyncAction =
      AsyncAction('RandomizerStoreBase.refreshActivity');

  @override
  Future refreshActivity() {
    return _$refreshActivityAsyncAction.run(() => super.refreshActivity());
  }

  @override
  String toString() {
    return '''
activityState: ${activityState}
    ''';
  }
}
