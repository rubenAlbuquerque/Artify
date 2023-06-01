import 'package:flutter/material.dart';

class MyLibraryPage extends StatelessWidget {
  const MyLibraryPage({
    Key? key,
    // required this.data
  }) : super(key: key);

  // final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyLibraryPage Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(data),
            ElevatedButton(
              child: const Text('Go back!'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
