
import 'package:bored_flutter_app/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(this.isDArkMode);

  final bool isDArkMode;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/app_bar_bg_light.png", color: isDArkMode ? AppColors.purpleDark : AppColors.purpleLight, key: const Key("appbarKey"),);
  }

  @override
  Size get preferredSize => Size(double.infinity, 150);


}