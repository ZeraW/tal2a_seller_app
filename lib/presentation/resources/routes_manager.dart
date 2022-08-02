import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tal2a_seller_app/presentation/shipments/shipment.dart';
import 'package:tal2a_seller_app/presentation/splash/splash_view.dart';
import 'package:tal2a_seller_app/wrapper.dart';

import '../login/login.dart';



class Routes {
  static const String splashRoute = "/";
  static const String wrapperRoute = "/wrapper";
  static const String shipmentRoute = "/shipment";


}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.wrapperRoute:
        return MaterialPageRoute(builder: (_) =>  const Wrapper());
      case Routes.shipmentRoute:
        return MaterialPageRoute(builder: (_) =>  const ShipmentScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('404'),
          ),
          body: const Center(child:  Text('404')),
        ));
  }
}