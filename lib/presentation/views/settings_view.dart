
import 'package:bored_flutter_app/constant/color.dart';
import 'package:bored_flutter_app/constant/custom_icons_icons.dart';
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsView extends StatelessWidget {
  const SettingsView(this.store, {required Key key}) : super(key: key);

  final SettingsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          key: Keys.settingsPageKey,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: 24,
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SwitchListTile(
                title: Row(
                  children: [
                    settingsLeading(context, Icon(CustomIcons.random)),
                    SizedBox(width: 16.0,),
                    Text("Dark mode"),
                  ],
                ),
                value: store.useDarkMode!,
                onChanged: (value) => store.setDarkMode(value),
                activeColor: AppColors.purpleDark,
              )
            ],
          ),
        );
      },
    );
  }

  Widget settingsLeading(BuildContext context, Icon icon) => Container(
    height: 50.0,
    width: 50.0,
    alignment: Alignment.center,
    child: Stack(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
        )
      ],
    ),
  );
}