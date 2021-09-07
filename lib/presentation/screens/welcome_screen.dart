
import 'package:bored_flutter_app/core/constant/key.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:bored_flutter_app/presentation/views/onboarding_view.dart';
import 'package:bored_flutter_app/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Consumer<SettingsStore>(
        builder: (_, store, __) =>
            OnBoardingView(store, key: Keys.onboardingPageKey),
      ),
    );
  }
}