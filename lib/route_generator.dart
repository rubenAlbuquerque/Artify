import 'package:flutter/material.dart';
// import 'package:artify/main.dart';
import 'package:artify/screens/home_page.dart';
import 'package:artify/screens/search_page.dart';
import 'package:artify/screens/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments; // Object
    

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const MyLoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/search':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => MySearchPage(
              // MySearchPage
              data: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
