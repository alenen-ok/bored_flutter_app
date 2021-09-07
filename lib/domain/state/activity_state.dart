
import 'package:bored_flutter_app/core/constant/enum.dart';
import 'package:bored_flutter_app/domain/model/activity.dart';

class ActivityState {
  ActivityState._();

  factory ActivityState.init() = ActivityStateInit;

  factory ActivityState.loading() = ActivityStateLoading;

  factory ActivityState.loaded(Activity? activity) = ActivityStateLoaded;

  factory ActivityState.error(ErrorType errorMessage) = ActivityStateError;

}

class ActivityStateInit extends ActivityState {
  ActivityStateInit() : super._();
}

class ActivityStateLoading extends ActivityState {
  ActivityStateLoading() : super._();
}

class ActivityStateLoaded extends ActivityState {
  ActivityStateLoaded(this.activity) : super._();

  final Activity? activity;
}

class ActivityStateError extends ActivityState {
  ActivityStateError(this.errorMessage) : super._();

  final ErrorType errorMessage;
}