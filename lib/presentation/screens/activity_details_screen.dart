
import 'package:bored_flutter_app/core/constant/key.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/presentation/views/details_view.dart';
import 'package:bored_flutter_app/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          appBar: CustomAppBar(),
          body: Consumer<SearchStore>(
            builder: (_, store, __) =>
                ActivityDetailsView(store, key: Keys.activityDetailsPageKey),
          ),
        ),
      );
  }
}
