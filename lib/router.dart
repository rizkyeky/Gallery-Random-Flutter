import 'package:flutter/material.dart';
import 'view/MainTabView.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainTabView());
      // case '/input':
      //   return MaterialPageRoute(builder: (_) => InputWallet());
      // case '/details':
      //   String walletName = settings.arguments;
      //   return MaterialPageRoute(builder: (_) => Details(walletName));
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}