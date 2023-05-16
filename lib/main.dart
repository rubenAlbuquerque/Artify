import 'package:artify/route_generator.dart';
import 'package:flutter/material.dart';
// import './screens/login-page.dart';

void main() {
  runApp(const MyApp());
  // build\app\outputs\flutter-apk\app-debug.apk
}

// MyHomePage
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),

// home: const MyLoginPage(),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
