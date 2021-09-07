

import 'package:flutter/material.dart';

class ActivityNotFoundCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              blurRadius: 15,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/images/sorry.png",
                  height: 120.0,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              Text(
                "SORRY...",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "We could not find an activity that matches your parameters",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Please change your search parameters and try again",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}