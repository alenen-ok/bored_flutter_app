import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/details/activity_details_store.dart';
import 'package:bored_flutter_app/presentation/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ActivityDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SafeArea(
        top: false,
        child: Scaffold(
          body: Consumer<ActivityDetailsStore>(
            builder: (_, store, __) =>
                ActivityDetailsView(store, key: Keys.activityDetailsPageKey),
          ),
        ),
      );
    });
  }
}
