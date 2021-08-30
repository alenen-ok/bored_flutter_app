
import 'package:bored_flutter_app/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/app_bar_bg_light.png",
      color: Theme.of(context).colorScheme.primary,
      key: const Key("appbarKey"),);
  }

  @override
  Size get preferredSize => Size(double.infinity, 150);


}