import 'package:flutter/material.dart';
// import 'package:artify/screens/login_page.dart';
// import 'package:artify/screens/home_page.dart';
// import 'package:artify/screens/profile_page.dart';
// import 'package:artify/screens/search_page.dart';

// MyHomePage with a appbar (img, name, icons) and a navbar (home, search, library, profile)
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

// MyHomePageState
class MyHomePageState extends State<MyHomePage> {
  // int _selectedIndex = 0;
  // late List<Widget> _pages;

  // @override
  // void initState() {
  //   super.initState();
  //   _pages = [
  //     const MyHomePage(),
  //     const MySearchPage(),
  //     const ProfilePage(),
  //   ];
  // }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // MyHomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      // body: _pages[0],
      body: const Center(
        child: Text('Home Page'),
      ),
      
    );
  }
}



// class BasicStructure extends StatefulWidget {
//   const BasicStructure({Key? key}) : super(key: key);

//   @override
//   _BasicStructureState createState() => _BasicStructureState();
// }

// class _BasicStructureState extends State<BasicStructure> {
//   int _selectedIndex = 0;
//   late List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       const MyHomePage(),
//       const MySearchPage(),
//       const ProfilePage(),
//     ];
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My App'),
//       ),
//   body: _pages[_selectedIndex],
//   bottomNavigationBar: BottomNavigationBar(
//     items: const <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: Icon(Icons.home),
//         label: 'Home',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.search),
//         label: 'Search',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.person),
//         label: 'Profile',
//       ),
//     ],
//     currentIndex: _selectedIndex,
//     onTap: _onItemTapped,
//   ),
// );
//   }
// }




// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var iconSizee = 32.0;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:
//             Colors.transparent, // Define a cor de fundo do app bar como branco
//         elevation: 0, // Remove a sombra da app bar
//         automaticallyImplyLeading: false, // Remove a seta de volta
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.asset(
//                 'assets/icons/logo.png',
//                 height: 32, // Define a altura da imagem como 32
//                 width: 32, // Define a largura da imagem como 32
//               ), // Adiciona o logo
//             ),
//             const SizedBox(
//               width: 1, // Adiciona um espaço vazio com largura de 8
//             ),
//             const Text(
//               'Artify',
//               style: TextStyle(
//                 color: Colors.black, // Define a cor do texto como preto
//                 fontWeight:
//                     FontWeight.bold, // Define a espessura da fonte como negrito
//                 fontSize: 25, // Define o tamanho da fonte como 20
//               ),
//             ),
//             const Spacer(), // Adiciona um espaço vazio para separar os ícones
//             IconButton(
//               onPressed: () {
//                 // Adicione o código para a ação do botão de download aqui
//               },
//               icon: const Icon(Icons.download),
//               color: Colors.black,
//               hoverColor: Colors.transparent,
//               // hoverColor: Colors.grey.withOpacity(0.1),
//               splashRadius: 30,
//               iconSize: iconSizee,
//               tooltip: 'Download',
//             ),
//             IconButton(
//               onPressed: () {
//                 // Adicione o código para a ação do botão de notificações aqui
//               },
//               icon: const Icon(Icons.notifications),
//               color: Colors.black,
//               hoverColor: Colors.grey.withOpacity(0.1),
//               splashRadius: 30,
//               iconSize: iconSizee,
//               tooltip: 'Notificações',
//             ),
//             GestureDetector(
//               onTap: () {
//                 // Add your onTap logic here
//                 // print('Column tapped!');
//               },
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.zero,
//                     child: IconButton(
//                       icon: ClipRRect(
//                         borderRadius: BorderRadius.circular(50.0),
//                         child: Image.asset(
//                           'assets/icons/logo.png',
//                           height: iconSizee,
//                           width: iconSizee,
//                         ),
//                       ),
//                       onPressed: () {
//                         // print('Column pressedS!');
//                       },
//                       hoverColor: Colors.transparent,
//                       splashRadius: 32,
//                       iconSize: iconSizee,
//                       splashColor: Colors.grey.withOpacity(0.4),
//                       tooltip: 'Imagem Google',
//                     ),
//                   ),
//                   const Text('ruben', style: TextStyle(fontSize: 10)),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),

      // body: Center(
      //   child: ElevatedButton(
      //     child: const Text('Go to second page'),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/search');
      //     },
      //   ),
      // ),
//       // body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Ho',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Se',
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.library_music),
//           //   label: 'Li',
//           // ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Pe',
//           ),
//         ],
//         // currentIndex: _selectedIndex,
//         // onTap: _onItemTapped,
//       ),
//     );
//   }
// }






// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    // var myIcon = const Icon(Icons.image);
//     var iconSizee = 32.0;
//     return Scaffold(
      // appBar: AppBar(
      //   backgroundColor:
      //       Colors.transparent, // Define a cor de fundo do app bar como branco
      //   elevation: 0, // Remove a sombra da app bar
      //   automaticallyImplyLeading: false, // Remove a seta de volta
      //   title: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset(
      //           'assets/icons/logo.png',
      //           height: 32, // Define a altura da imagem como 32
      //           width: 32, // Define a largura da imagem como 32
      //         ), // Adiciona o logo
      //       ),
      //       const SizedBox(
      //         width: 1, // Adiciona um espaço vazio com largura de 8
      //       ),
      //       const Text(
      //         'Artify',
      //         style: TextStyle(
      //           color: Colors.black, // Define a cor do texto como preto
      //           fontWeight:
      //               FontWeight.bold, // Define a espessura da fonte como negrito
      //           fontSize: 25, // Define o tamanho da fonte como 20
      //         ),
      //       ),
      //       const Spacer(), // Adiciona um espaço vazio para separar os ícones
      //       IconButton(
      //         onPressed: () {
      //           // Adicione o código para a ação do botão de download aqui
      //         },
      //         icon: const Icon(Icons.download),
      //         color: Colors.black,
      //         hoverColor: Colors.transparent,
      //         // hoverColor: Colors.grey.withOpacity(0.1),
      //         splashRadius: 30,
      //         iconSize: iconSizee,
      //         tooltip: 'Download',
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           // Adicione o código para a ação do botão de notificações aqui
      //         },
      //         icon: const Icon(Icons.notifications),
      //         color: Colors.black,
      //         hoverColor: Colors.grey.withOpacity(0.1),
      //         splashRadius: 30,
      //         iconSize: iconSizee,
      //         tooltip: 'Notificações',
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           // Add your onTap logic here
      //           print('Column tapped!');
      //         },
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Container(
      //               padding: EdgeInsets.zero,
      //               child: IconButton(
      //                 icon: ClipRRect(
      //                   borderRadius: BorderRadius.circular(50.0),
      //                   child: Image.asset(
      //                     'assets/icons/logo.png',
      //                     height: iconSizee,
      //                     width: iconSizee,
      //                   ),
      //                 ),
      //                 onPressed: () {
      //                   print('Column pressedS!');
      //                 },
      //                 hoverColor: Colors.transparent,
      //                 splashRadius: 32,
      //                 iconSize: iconSizee,
      //                 splashColor: Colors.grey.withOpacity(0.4),
      //                 tooltip: 'Imagem Google',
      //               ),
      //             ),
      //             const Text('ruben', style: TextStyle(fontSize: 10)),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // body: Center(
//         child: ElevatedButton(
//           child: const Text('Go to second page'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const MyLoginPage()),
//             );
//             // Navigator.pushNamed(
//             //   context,
//             //   '/search',
//             //   arguments: 'Hello from MyHomePage',
//             // );
//           },
//         ),
//       ),
//     );
//   }
// }
