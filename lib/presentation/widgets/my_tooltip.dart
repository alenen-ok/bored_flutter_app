
import 'package:bored_flutter_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  MyTooltip({required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
      padding: EdgeInsets.all(16),
      textStyle: TextStyle(color: AppColors.white),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
    // Timer(Duration(seconds: 3), () => tooltip?.deactivate());
  }
}