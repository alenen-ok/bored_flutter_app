
import 'package:flutter/material.dart';

class EmptyRandomScreenHint extends StatelessWidget {
  const EmptyRandomScreenHint();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168.0,
      margin: EdgeInsets.all(24.0),
      alignment: Alignment(0, 1.08),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Press this button for generation activity",
            softWrap: true, textAlign: TextAlign.center,),
          SizedBox(height: 16,),
          Image.asset("assets/images/down-arrow.png",
            color: Theme.of(context).colorScheme.primary,
            width: 24,
            height: 24,
          )
        ],
      ),
    );
  }

}