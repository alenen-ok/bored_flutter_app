
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
    return navigationKey.currentState?.pushNamed(_rn, arguments: args);
  }

  goBack(){
    return navigationKey.currentState?.pop();
  }
}