import 'package:mobx/mobx.dart';

import 'package:bored_flutter_app/constant/enum.dart';

part 'destinations_store.g.dart';

class DestinationsStore = DestinationsStoreBase with _$DestinationsStore;

abstract class DestinationsStoreBase with Store {
  static const List<Destination> destinations = Destination.values;

  @observable
  int selectedDestinationIndex = destinations.indexOf(Destination.Search);

  @computed
  Destination get selectedDestination => destinations[selectedDestinationIndex];

  @action
  void selectDestination(int index) {
    selectedDestinationIndex = index;
  }
}