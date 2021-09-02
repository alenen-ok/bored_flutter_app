

import 'package:flutter/material.dart';

class StarsIndicator extends StatelessWidget {
  const StarsIndicator(this.value); // from 0.0 to 1.0

  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Star(value > 0 ? value > 0.1 ? VISIBLE : HALFVISIBLE : INVISIBLE),
        SizedBox(width: 5.0,),
        Star(value > 0.2 ? value > 0.3 ? VISIBLE : HALFVISIBLE : INVISIBLE),
        SizedBox(width: 5.0,),
        Star(value > 0.4 ? value > 0.5 ? VISIBLE : HALFVISIBLE : INVISIBLE),
        SizedBox(width: 5.0,),
        Star(value > 0.6 ? value > 0.7 ? VISIBLE : HALFVISIBLE : INVISIBLE),
        SizedBox(width: 5.0,),
        Star(value > 0.8 ? value > 0.9 ? VISIBLE : HALFVISIBLE : INVISIBLE),
      ],
    );
  }

}

class Star extends StatelessWidget {
  const Star(this.visibleCode);

  final int visibleCode;

  @override
  Widget build(BuildContext context) {
    Color leftColor, rightColor;
    switch (visibleCode) {
      case VISIBLE:
        leftColor = rightColor = Theme.of(context).primaryColorDark;
        break;
      case HALFVISIBLE:
        leftColor = Theme.of(context).primaryColorDark;
        rightColor = Colors.transparent;
        break;
      case VISIBLE:
        leftColor = rightColor = Colors.transparent;
        break;
      default:
        leftColor = rightColor = Colors.transparent;
    }
    return Row(
      children: [
        Stack(
          children: [
            Image.asset("assets/images/star_left.png", color: leftColor, width: 12.0, ),
            Image.asset("assets/images/star_border_left.png", color: Theme.of(context).primaryColorDark, width: 12.0, ),
          ],
        ),
        Stack(
          children: [
            Image.asset("assets/images/star_right.png", color: rightColor, width: 12.0, ),
            Image.asset("assets/images/star_border_right.png", color: Theme.of(context).primaryColorDark, width: 12.0, ),
          ],
        ),

      ],
    );
  }
}

const int VISIBLE = 1;
const int HALFVISIBLE = 2;
const int INVISIBLE = 3;
