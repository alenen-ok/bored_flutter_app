
import 'package:bored_flutter_app/domain/store/destination/destinations_store.dart';
import 'package:bored_flutter_app/presentation/widgets/animated_bottom_navigation_bar.dart';
import 'package:bored_flutter_app/presentation/widgets/app_bar.dart';
import 'package:bored_flutter_app/presentation/widgets/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.darkMode, Key? key}) : super(key: key);

  final bool darkMode;
  @override
  Widget build(BuildContext context) {
    return Consumer<DestinationsStore>(
      builder: (context, store, _) {
        return Observer(builder: (_) {
          return SafeArea(
            top: false,
            child: Scaffold(
              appBar: CustomAppBar(darkMode),
              body: PageContainer(store.selectedDestination),
              bottomNavigationBar: AnimatedTabBar(
                key: const Key('bottomNavigationBar'),
                onTap: (index) => store.selectDestination(index),
                currentIndex: store.selectedDestinationIndex,
                isSDarkMode: darkMode,
              ),
            ),
          );
        });
      },
    );
  }

}