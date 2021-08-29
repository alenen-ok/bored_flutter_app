// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomizer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RandomizerStore on RandomizerStoreBase, Store {
  final _$activityAtom = Atom(name: 'RandomizerStoreBase.activity');

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

  final _$isLoadingAtom = Atom(name: 'RandomizerStoreBase.isLoading');

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

  final _$getRandomActivityAsyncAction =
      AsyncAction('RandomizerStoreBase.getRandomActivity');

  @override
  Future<void> getRandomActivity() {
    return _$getRandomActivityAsyncAction.run(() => super.getRandomActivity());
  }

  @override
  String toString() {
    return '''
activity: ${activity},
isLoading: ${isLoading}
    ''';
  }
}
