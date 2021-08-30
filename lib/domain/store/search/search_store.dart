
import 'package:bored_flutter_app/domain/service/navigation_service.dart';
import 'package:bored_flutter_app/internal/dependencies/navigation_module.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  final NavigationService _navigationService = NavigationModule.navigationService();

  @observable
  int counter = 0;

  @action
  void incrementCounter() {
    counter++;
  }

  @action
  void navigateToDetails() {
    _navigationService.navigateTo("activity_details_screen");
  }
}