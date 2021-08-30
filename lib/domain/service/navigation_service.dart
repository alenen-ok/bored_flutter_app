
import 'package:flutter/material.dart';

class NavigationService{
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  // Future<dynamic>? popAndNavigateTo(String _rn){
  //   return navigationKey.currentState?.popAndPushNamed(_rn);
  // }
  //
  // Future<dynamic>? navigateToReplacement(String _rn){
  //   return navigationKey.currentState?.pushReplacementNamed(_rn);
  // }

  Future<dynamic>? navigateTo(String _rn, {dynamic args}){

    print("navigate To");
    print(navigationKey.currentState.toString());
    return navigationKey.currentState?.pushNamed(_rn, arguments: args);
  }

  Future<dynamic>? navigateToRoute(MaterialPageRoute _rn){
    return navigationKey.currentState?.push(_rn);
  }

  goBack(){
    return navigationKey.currentState?.pop();
  }
}