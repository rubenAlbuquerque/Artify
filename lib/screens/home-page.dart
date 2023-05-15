import 'package:flutter/material.dart';
import 'package:artify/screens/login-page.dart';

// // MyHomePage
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to second page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyLoginPage()),
            );
            // Navigator.pushNamed(
            //   context,
            //   '/search',
            //   arguments: 'Hello from MyHomePage',
            // );
          },
        ),
      ),
    );
  }
}
