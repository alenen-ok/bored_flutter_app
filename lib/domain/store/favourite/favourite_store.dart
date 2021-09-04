
import 'package:mobx/mobx.dart';

part 'favourite_store.g.dart';

class FavouritesStore = FavouritesStoreBase with _$FavouritesStore;

abstract class FavouritesStoreBase with Store {
  FavouritesStoreBase() {
    print("FavouritesStoreBase constructor");
  }
}