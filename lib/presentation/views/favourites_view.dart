
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/favourite/favourite_store.dart';
import 'package:bored_flutter_app/presentation/widgets/liked_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouritesView extends StatelessWidget {
  FavouritesView(this.store, {required Key key}) : super(key: key) {
    store.getActivities();
  }

  final FavouritesStore store;

  @override
  Widget build(BuildContext context) {
    final SlidableController slidableController = SlidableController();
    return Observer(
      builder: (context) {
        return Column(
          key: Keys.favouritesPageKey,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(24.0),
              child: Text(
                "Liked activities",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            (store.isLoading) ?
              Center(child: CircularProgressIndicator(),)
            :
              Expanded(
                child: Scrollbar(
                  child: ListView.separated(shrinkWrap: true,
                  itemBuilder:
                      (ctx, index) =>  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: LikedActivity(
                          activity: store.likedActivities[index],
                          controller: slidableController,
                          onRemove: () {
                            store.removeActivityFromLiked(index);
                          },
                        ),
                      ),
                    itemCount: store.likedActivities.length, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8,),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}