
import 'package:bored_flutter_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class SimpleIconButton extends StatelessWidget {
  const SimpleIconButton({required this.onTap, required this.icon});

  final VoidCallback? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.0,
        height: 56.0,
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
        child: Icon(
            icon,
            color: AppColors.white
        ),
      ),
    );
  }

}