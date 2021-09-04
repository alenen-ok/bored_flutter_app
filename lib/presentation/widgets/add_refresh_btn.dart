

import 'package:bored_flutter_app/constant/color.dart';
import 'package:flutter/material.dart';

import 'empty_random_screen_hint.dart';

class AddRefreshButton extends StatefulWidget {
  const AddRefreshButton({required this.onTap, required this.isActivated, Key? key}) : super(key: key);

  final VoidCallback? onTap;
  final bool isActivated;

  @override
  State<StatefulWidget> createState() => AddRefreshButtonState();

}

class AddRefreshButtonState extends State<AddRefreshButton> {

  var _key = GlobalKey();
  bool activated = false;

  @override
  void initState() {
    super.initState();
    activated = widget.isActivated;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!activated) {
          setState(() {
            activated = true;
          });
        }
        widget.onTap?.call();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!activated) EmptyRandomScreenHint(),
          Container(
            key: _key, // TODO check hashes
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 10,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            height: 56.0,
            width: 56.0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedSwitcher(
                  child: !activated ? Icon(
                    Icons.add,
                    color: AppColors.white
                  ) : SizedBox(),
                  duration: Duration(milliseconds: 600),
                ),
                AnimatedSwitcher(
                  child: activated ? Icon(
                    Icons.refresh,
                    color: AppColors.white
                  ) : SizedBox(),
                  duration: Duration(milliseconds: 600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}