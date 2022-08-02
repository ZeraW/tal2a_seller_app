import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> key;

  static NavigationService instance = NavigationService();


  NavigationService() {
    key = GlobalKey<NavigatorState>();
  }

  Future<dynamic> navigateToReplacement(String rn) {
    return key.currentState!.pushReplacementNamed(rn);
  }

  Future<dynamic> navigateTo(String rn) {
    return key.currentState!.pushNamed(rn);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute rn) {
    return key.currentState!.push(rn);
  }

  Future<dynamic> navigateToWidget(Widget rn) {
    return key.currentState!.push(MaterialPageRoute(builder: (_) => rn));
  }

  goBack() {
    return key.currentState!.pop();
  }

  void pushReplacement(String newRouteName) {
    bool isNewRouteSameAsCurrent = false;

    key.currentState!.popUntil((route) {
      if (route.settings.name == newRouteName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });
    if (!isNewRouteSameAsCurrent) {
      key.currentState!.pushNamedAndRemoveUntil(newRouteName, (Route<dynamic> route) => false);
    }
  }
}