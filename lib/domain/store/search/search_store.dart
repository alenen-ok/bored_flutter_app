
import 'package:bored_flutter_app/domain/service/navigation_service.dart';
import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  SearchStoreBase(this._navigationService);

  final NavigationService _navigationService;

  @action
  void navigateToDetails() {
    _navigationService.navigateTo("activity_details_screen");
  }
}