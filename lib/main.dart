import 'package:artify/route_generator.dart';
import 'package:flutter/material.dart';
import './screens/login-page.dart';

void main() {
  runApp(const MyApp());
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
        primarySwatch: Colors.blue,
      ),

      // home: const MyLoginPage(),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


// // FirstPage
// class FirstPage extends StatelessWidget {
//   const FirstPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Go to second page'),
//           onPressed: () {
//             Navigator.pushNamed(
//               context,
//               '/search',
//               arguments: 'Hello from FirstPage',
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// // SecondPage

// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key, required this.data}) : super(key: key);

//   final String data;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(data),
//             ElevatedButton(
//               child: const Text('Go back!'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }







// MyHomePage statelss widget with one text centered
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text('Hello World'),
//       ),
//     );
//   }
// }