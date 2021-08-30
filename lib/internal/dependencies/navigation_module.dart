

import 'package:bored_flutter_app/domain/service/navigation_service.dart';

class NavigationModule {
  static NavigationService? _navigationService;

  static NavigationService navigationService() {
    if (_navigationService == null) {
      _navigationService = NavigationService();
    }
    return _navigationService!;
  }
}