// import 'package:artify/screens/search_page.dart';
import 'package:artify/firebase_options.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:artify/services/services.dart';
import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'dart:async';
import 'package:artify/screens/ui.dart';

// import 'package:audioplayers/audio_cache.dart';
// import 'package:flutter_audio_cache/flutter_audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:spotify_clone/theme/colors.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:dcdg/dcdg.dart';

// import 'package:audioplayers/audioplayers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcmToken = await FirebaseMessaging.instance.getToken();

  FirebaseMessaging.instance.getToken().then((token) {
    // O token será retornado aqui após a inicialização bem-sucedida
    print('FCM Token: $token');
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn =
        authService.isUserSignedIn(); // Verificar se o usuário está logado

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isUserLoggedIn
          ? '/home'
          : '/login', // Definir a rota inicial com base no login
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/library': (context) => const LibraryPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isUserLoggedIn = AuthService().isUserSignedIn(); // Verificar se o usuário está logado

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Meu App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: isUserLoggedIn
//           ? '/home'
//           : '/login', // Definir a rota inicial com base no login
//       routes: {
//         '/login': (context) => const LoginPage(),
//         '/home': (context) => const HomePage(),
//         '/search': (context) => const SearchPage(),
//         '/library': (context) => const LibraryPage(),
//         '/profile': (context) => const ProfilePage(),
//       },
//     );
//   }
// }


// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         // add background image
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/background.jpg'),
//             fit: BoxFit.cover,
//             colorFilter: ColorFilter.mode(
//                 Color.fromARGB(122, 0, 0, 0), BlendMode.darken),
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // add a text
//               const Text(
//                 'As tuas musicas \n no Artify',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   // text align center
//                   // fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               // add a button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const HomePage()),
//                   );
//                   // SignInButton(
//                   //   Buttons.Google,
//                   //   onPressed: () {
//                   //     // Lógica de autenticação com o Google aqui
//                   //     Navigator.pushReplacementNamed(context, '/home');
//                   //   },
//                   // ),
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   fixedSize: const Size(200, 40),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Image(
//                       image: AssetImage('assets/icons/google.png'),
//                       height: 25,
//                       width: 25,
//                     ),
//                     SizedBox(width: 15),
//                     Text(
//                       'Login with Google',
//                       style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.black,
//                           fontWeight: FontWeight.normal),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Story {
//   final String imageUrl;
//   final String username;

//   Story({
//     required this.imageUrl,
//     required this.username,
//   });
// }

// class Post {
//   final String userImageUrl;
//   final String username;
//   final String description;

//   final String date;
//   final String largeImageUrl;
//   final int likes;
//   final int comments;
//   final int shares;

//   Post({
//     required this.userImageUrl,
//     required this.username,
//     required this.description,
//     required this.date,
//     required this.largeImageUrl,
//     required this.likes,
//     required this.comments,
//     required this.shares,
//   });
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomeState();
// }

// class _HomeState extends State<HomePage> {
//   // int _selectedIndex = 0;

//   late List<Story> stories;
//   late List<Post> posts; // Adicione a declaração da lista de posts
//   late Timer timer;
//   // bool mounted = true;

//   List<Story> generateStories(int count) {
//     List<Story> stories = [];
//     for (int i = 0; i < count; i++) {
//       stories.add(
//         Story(
//           imageUrl: 'https://via.placeholder.com/150',
//           username: 'User $i',
//         ),
//       );
//     }
//     return stories;
//   }

//   List<Post> generatePosts(int count) {
//     List<Post> posts = [];
//     for (int i = 0; i < count; i++) {
//       posts.add(
//         Post(
//           userImageUrl: 'https://via.placeholder.com/50',
//           username: 'User $i',
//           description: 'This is post number $i',
//           date: '$i June 2021',
//           // Defina a data de publicação desejada
//           largeImageUrl:
//               'https://via.placeholder.com/500', // URL da foto em tamanho grande
//           likes: 20, // Número de curtidas inicial
//           comments: 30, // Número de comentários inicial
//           shares: 50,
//         ),
//       );
//     }

//     return posts;
//   }

//   @override
//   void initState() {
//     super.initState();
//     stories = generateStories(5); // Defina o número de histórias desejado
//     posts = generatePosts(10); // Defina o número de posts desejado

//     // timer = Timer.periodic(const Duration(seconds: 60), (Timer t) {
//     //   if (!mounted) {
//     //     timer.cancel();
//     //   } else {
//     //     setState(() {});
//     //   }
//     // });
//   }

//   // late var timer;
//   // void initState() {
//   //   super.initState();
//   //   // fetchDataVip();
//   //   Timer.periodic(const Duration(seconds: 60), (Timer t) {
//   //     if (!mounted) {
//   //       timer.cancel();
//   //     } else {
//   //       setState(() {});
//   //     }
//   //   });
//   // }

//   // @override
//   // void dispose() {
//   //   timer.cancel();
//   //   super.dispose();
//   // }

//   void _handleTabChange(int index) {
//     // if (mounted) {
//     // setState(() {
//     // Lógica de alteração de guia aqui
//     // index;
//     // onTabChange: (index) {
//     // print(index);

//     if (index == 0) {
//       Navigator.pushReplacementNamed(context, '/home');
//     } else if (index == 1) {
//       Navigator.pushReplacementNamed(context, '/search');
//     } else if (index == 2) {
//       Navigator.pushReplacementNamed(context, '/library');
//     } else if (index == 3) {
//       Navigator.pushReplacementNamed(context, '/profile');
//     }
//     // });
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0, // Remover sombra da AppBar
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false, // Remover botão de retorno
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/images/playstore.png',
//               width: 32,
//               height: 32,
//             ),
//             const SizedBox(width: 8),
//             const Text(
//               'Artify',
//               style: TextStyle(fontSize: 20, color: Colors.black),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.upload, color: Colors.black),
//             onPressed: () {
//               // Lógica para o botão de upload
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.black),
//             onPressed: () {
//               // Lógica para o botão de notificações
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.person, color: Colors.black),
//             onPressed: () {
//               // Lógica para o botão de perfil
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           // Widget para exibir as histórias
//           SizedBox(
//             height: 100,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: stories.length,
//               itemBuilder: (context, index) {
//                 // Aqui você pode construir cada item de história (story) com base nos dados disponíveis
//                 // Pode usar o widget CircleAvatar para exibir a imagem do usuário
//                 // Pode adicionar um nome de usuário ou outros detalhes abaixo da imagem
//                 return Container(
//                   width: 80,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 0,
//                     vertical: 10,
//                   ),
//                   // Ajuste as margens horizontais para reduzir o espaçamento entre os itens
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(stories[index].imageUrl),
//                       ),
//                       // const SizedBox(height: 2),
//                       Text(stories[index].username),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           // Widget para exibir as publicações
//           ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: posts.length,
//             itemBuilder: (context, index) {
//               // Extrair os dados do post atual
//               final post = posts[index];

//               return Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 8,
//                     ),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 15,
//                           backgroundImage: NetworkImage(post.userImageUrl),
//                         ),
//                         const SizedBox(width: 8),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               post.username,
//                               style: const TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black),
//                             ),
//                             Text(
//                               post.date,
//                               style: const TextStyle(fontSize: 11),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Exibir a foto em tamanho grande
//                   Stack(
//                     children: [
//                       Image.network(post.largeImageUrl),
//                       Positioned(
//                         left: 10,
//                         bottom: 0,
//                         child: ClipRRect(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                           ),
//                           child: Container(
//                             // width: 200,
//                             padding: const EdgeInsets.all(8),
//                             color: Colors.black.withOpacity(0.3),

//                             width: MediaQuery.of(context).size.width * 0.9,

//                             child: Text(
//                               post.description,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 10,
//                                 // fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 8,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Row(
//                               children: [
//                                 const Icon(Icons.favorite,
//                                     color: Colors.red, size: 30),
//                                 const SizedBox(width: 2),
//                                 Text('${post.likes}'),
//                               ],
//                             ),
//                             const SizedBox(width: 14),
//                             Row(
//                               children: [
//                                 const Icon(Icons.comment,
//                                     color: Colors.blue, size: 30),
//                                 const SizedBox(width: 2),
//                                 Text('${post.comments}'),
//                               ],
//                             ),
//                             const SizedBox(width: 8),
//                             Row(
//                               children: [
//                                 const Icon(Icons.share,
//                                     color: Colors.green, size: 30),
//                                 const SizedBox(width: 2),
//                                 Text(' ${post.shares}'),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.add_circle_outline),
//                                 iconSize: 24,
//                                 // padding: const EdgeInsets.all(5),
//                                 onPressed: () {
//                                   // Lógica para adicionar ação
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Spacer(), // Adiciona um espaço flexível para empurrar o botão "add" para a direita
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: const Color.fromARGB(75, 70, 70, 70),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           child: GNav(
//             // backgroundColor: Color.fromARGB(0, 136, 136, 136),
//             // rippleColor: Color.fromARGB(255, 226, 0, 0),
//             // hoverColor: Color.fromARGB(255, 0, 255, 13),
//             color: Colors.black,
//             activeColor: const Color.fromARGB(255, 214, 214, 214),
//             // tabActiveBorder:
//             //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
//             tabBackgroundColor: Colors.black,
//             // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
//             // selectedIndex: _selectedIndex, 0
//             gap: 6,
//             iconSize: 24,
//             // selectedIndex: 0,
//             // selectedIndex: _selectedIndex, // Set the initial selected index
//             onTabChange: _handleTabChange, // Set the onTabChange callback

//             tabs: const [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Home',
//                 // height: 100.0,
//               ),
//               GButton(
//                 icon: Icons.search,
//                 text: 'Search',
//               ),
//               GButton(
//                 icon: Icons.library_books,
//                 text: 'Library',
//               ),
//               GButton(
//                 icon: Icons.person,
//                 text: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   State<SearchPage> createState() => _SearchState();
// }

// class Album {
//   final String name;
//   final String imageUrl;

//   Album({required this.name, required this.imageUrl});
// }

// class _SearchState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _searchFocusNode = FocusNode();
//   List<String> results = [];

//   List<Album> albums = [
//     Album(
//       name: "StarBoy 1",
//       imageUrl: "assets/images/3.jpg",
//     ),
//     Album(
//       name: "StarBoy 2",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 3",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     // Adicione mais álbuns conforme necessário
//   ];

//   void search() {
//     // String searchTerm = _searchController.text;
//     // print searchTerm
//     // print(searchTerm);
//     // Faça aqui a lógica de pesquisa com base no searchTerm e atualize a lista de resultados
//     // Neste exemplo, vamos apenas filtrar uma lista de itens
//     // List<String> filteredList = albums
//     //     .where((album) =>
//     //         album.name.toLowerCase().contains(searchTerm.toLowerCase()))
//     //     .toList();

//     setState(() {
//       // results = filteredList;
//     });
//   }

//   late Timer timer;
//   // bool mounted = true;

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _searchFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 120,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         titleSpacing: 0.0,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 5, bottom: 0, right: 0, left: 0),
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(
//                     top: 4, bottom: 4, left: 15, right: 15),
//                 child: ElevatedButton(
//                   // onPressed: () {
//                   //   // Ação quando o botão for pressionado
//                   //   showSearch(
//                   //     context: context,
//                   //     delegate: MySearchDelegate(), //CustomSearchDelegate(),
//                   //   );
//                   // },
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const MySearchDelegate()),
//                     );
//                   },
//                   style: ButtonStyle(
//                     padding: MaterialStateProperty.all<EdgeInsets>(
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//                     ),
//                     backgroundColor:
//                         MaterialStateProperty.all<Color>(Colors.transparent),
//                     elevation: MaterialStateProperty.all<double>(0),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         side: const BorderSide(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   child: const Row(
//                     children: [
//                       Icon(
//                         Icons.search,
//                         color: Colors.black,
//                         size: 36,
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         'O que queres ouvir?',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               SizedBox(
//                 height: 40,
//                 child: ListView(
//                   padding: EdgeInsets.zero,
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     const SizedBox(width: 15),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Ação quando o botão "Albums" é pressionado
//                       },
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                           const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                         ),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.black),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: const BorderSide(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       child: const Text('Albums'),
//                     ),
//                     const SizedBox(width: 5),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Ação quando o botão "Artistas" é pressionado
//                       },
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                           const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                         ),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.black),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: const BorderSide(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       child: const Text('Artistas'),
//                     ),
//                     const SizedBox(width: 5),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Ação quando o botão "Músicas" é pressionado
//                       },
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                           const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                         ),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.black),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: const BorderSide(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       child: const Text('Músicas'),
//                     ),
//                     const SizedBox(width: 5),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Ação quando o botão "Playlists" é pressionado
//                       },
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                           const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                         ),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.black),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: const BorderSide(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       child: const Text('Playlists'),
//                     ),
//                     const SizedBox(width: 5),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Ação quando o botão "Playlists" é pressionado
//                       },
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all<EdgeInsets>(
//                           const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                         ),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.black),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             side: const BorderSide(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                       child: const Text('Playlists'),
//                     ),
//                     const SizedBox(width: 5),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 0),
//         //horizontal: 10.0).copyWith(right: 0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 14),
//                     child: Align(
//                       alignment: Alignment.centerLeft, // Alinhar à esquerda
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(vertical: 5),
//                         // Adicionar padding vertical
//                         child: Text(
//                           'New Albums',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     height: 150,
//                     child: ListView.builder(
//                       padding: EdgeInsets.zero,
//                       scrollDirection: Axis.horizontal,
//                       itemCount: albums.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         final album = albums[index];
//                         return GestureDetector(
//                           onTap: () {
//                             // Navegar para a página do reprodutor de música
//                             // print( 'Tocando ${album.name}, do ${album.imageUrl}');
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     // MusicDetailPage(), // AudioPlayerSreen(),
//                                     MusicDetailPage(
//                                   title: album.name,
//                                   description: "Wizkid",
//                                   color: Colors.black,
//                                   img: album.imageUrl,
//                                   songUrl: "assets/audio/gym.mp3",
//                                   // final String title;
//                                   // final String description;
//                                   // final Color color;
//                                   // final String img;
//                                   // final String songUrl;
//                                   // ),
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 14),
//                                 child: Container(
//                                   width: 120,
//                                   height: 120,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     image: DecorationImage(
//                                       image: AssetImage(album.imageUrl),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 14),
//                                 child: SizedBox(
//                                   width: 120,
//                                   child: Center(
//                                     child: Text(
//                                       album.name,
//                                       style: const TextStyle(fontSize: 14),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: const Color.fromARGB(75, 70, 70, 70),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           child: GNav(
//             // backgroundColor: Color.fromARGB(0, 136, 136, 136),
//             // rippleColor: Color.fromARGB(255, 226, 0, 0),
//             // hoverColor: Color.fromARGB(255, 0, 255, 13),
//             color: Colors.black,
//             activeColor: Color.fromARGB(255, 214, 214, 214),
//             // tabActiveBorder:
//             //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
//             tabBackgroundColor: Colors.black,
//             // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
//             // selectedIndex: _selectedIndex, 0
//             gap: 6,
//             iconSize: 24,
//             // selectedIndex: 0,
//             selectedIndex: 1,
//             onTabChange: (index) {
//               // print(index);

//               if (index == 0) {
//                 Navigator.pushReplacementNamed(context, '/home');
//               } else if (index == 1) {
//                 Navigator.pushReplacementNamed(context, '/search');
//               } else if (index == 2) {
//                 Navigator.pushReplacementNamed(context, '/library');
//               } else if (index == 3) {
//                 Navigator.pushReplacementNamed(context, '/profile');
//               }
//             },
//             tabs: const [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Home',
//                 // height: 100.0,
//               ),
//               GButton(
//                 icon: Icons.search,
//                 text: 'Search',
//               ),
//               GButton(
//                 icon: Icons.library_books,
//                 text: 'Library',
//               ),
//               GButton(
//                 icon: Icons.person,
//                 text: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Model musci data model
// class Result {
//   final String nome; //nome, nome muscia, nome album
//   final String type; // Musica, playlsi, artista
//   final String artist;
//   final String coverImg;
//   final String duration;

//   Result(this.nome, this.type, this.artist, this.coverImg, this.duration);
// }

// // MySearchDelegate
// class MySearchDelegate extends StatefulWidget {
//   const MySearchDelegate({Key? key}) : super(key: key);

//   @override
//   State<MySearchDelegate> createState() => _MySearchDelegateState();
// }

// class _MySearchDelegateState extends State<MySearchDelegate> {
//   // Result result = Result('nome', 'type', 'artists', 'coverImg', 'duration');
//   // Result
//   static List<Result> dummyResults = [
//     Result('Ruben', 'Artist', 'Ruben', 'assets/images/background.jpg', '-'),
//     Result('rui', 'Artist', 'rui', 'assets/images/background.jpg', '-'),
//     Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
//     Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
//     Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
//     Result('Nome Music 1', 'Music', 'WEb badga', 'assets/images/background.jpg',
//         '2:10min'),
//     Result('Nome Music 2', 'Music', 'Red', 'assets/images/background.jpg',
//         '3:10min'),
//     Result('Nome Music 3', 'Music', 'Green & Ruben',
//         'assets/images/background.jpg', '4:10min'),
//     Result('Nome Music 4', 'Music', 'Blue', 'assets/images/background.jpg',
//         '5:10min'),
//     Result('Ruben', 'Artist', 'Ruben', 'assets/images/background.jpg', '-'),
//     Result('rui', 'Artist', 'rui', 'assets/images/background.jpg', '-'),
//     Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
//     // Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
//   ];
//   // https://www.youtube.com/watch?v=jFHSkfjN96I

//   List<Result> display_results = [];

//   void updateList(String value) {
//     setState(() {
//       display_results = dummyResults
//           .where((element) =>
//               element.nome.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }

//   void clearList() {
//     setState(() {
//       display_results = [];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         bottom: PreferredSize(
//           preferredSize:
//               const Size.fromHeight(1.0), // Set the height of the border
//           child: Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Color.fromARGB(
//                       255, 122, 122, 122), // Set the color of the border
//                   width: 1.0, // Set the width of the border
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // toolbarHeight: 120,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         titleSpacing: 0.0,
//         leading: IconButton(
//           onPressed: () {
//             // showSearch(context: context, delegate: CustomSearchDelegate());
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             // backgroundColor: Colors.red,
//           ),
//         ),
//         title: TextField(
//           onChanged: (value) => updateList(value),
//           autofocus: true,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 16,
//             // remove the underline

//             decoration: TextDecoration.none,
//             fontWeight: FontWeight.bold,
//           ),
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             errorBorder: InputBorder.none,
//             disabledBorder: InputBorder.none,
//             // filled: true,
//             // fillColor: Color.fromARGB(255, 187, 22, 22),
//             // border: InputBorder.none,
//             hintText: 'O que queres ouvir?',
//             hintStyle: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               // bold
//               fontWeight: FontWeight.bold,
//             ),
//             // border: InputBorder.none,
//             // prefixIcon: Icon(Icons.arrow_back, color: Colors.black),
//             // prefixIconConstraints: BoxConstraints(
//             //   minWidth: 50,
//             //   minHeight: 50,
//             // ),
//             // border: OutlineInputBorder(
//             //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             //   borderSide: BorderSide.none,
//             //   // borderSide: BorderSide(
//             //   //   color: Color.fromARGB(0, 16, 16, 16),
//             //   //   width: 1,
//             //   // ),
//             // ),
//             // suffixIcon: IconButton(
//             //   onPressed: () {
//             //     // showSearch(context: context, delegate: CustomSearchDelegate());
//             //   },
//             //   icon: const Icon(Icons.clear, color: Colors.black),
//             // ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               // showSearch(context: context, delegate: CustomSearchDelegate());
//               // clear the search
//               clearList();
//               // updateList('');
//             },
//             icon: const Icon(Icons.clear, color: Colors.black),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 5.0,
//           ),
//           Expanded(
//             child: display_results.length == 0
//                 ? const Center(
//                     child: Text('No results Found',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                           // backgroundColor: Colors.red,
//                           // print('No results Found'),
//                         )),
//                   )
//                 : ListView.builder(
//                     itemCount: display_results.length,
//                     itemBuilder: (context, index) => ListTile(
//                       // backgroundColor: Colors.black,
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 10.0, vertical: 0.0),
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => MusicPlayer(),
//                         //   ),
//                         // );
//                       },
//                       title: Text(display_results[index].nome,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           )),
//                       subtitle: Text(
//                           '${display_results[index].nome} : ${display_results[index].artist}',
//                           style: const TextStyle(
//                             color: Colors.black87,
//                             // backgroundColor: Colors.black,
//                             // fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           )),
//                       // trailing: Text(display_results[index].duration,
//                       // style: const TextStyle(
//                       // color: Colors.black87,
//                       // fontWeight: FontWeight.bold,
//                       //  )),
//                       leading: Image(
//                         image: AssetImage(display_results[index].coverImg),
//                         // image: AssetImage('assets/icons/google.png'),
//                         fit: BoxFit.cover,
//                         height: 60,
//                         width: 60,
//                         // color: Colors.black,
//                         // colorBlendMode: BlendMode.darken,

//                         // For asset images
//                       ),
//                     ),
//                   ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class MusicDetailPage extends StatefulWidget {
//   final String title;
//   final String description;
//   final Color color;
//   final String img;
//   final String songUrl;
//   // detalhes da musica?? tempo, nome, artista, etc

//   const MusicDetailPage(
//       {Key? key,
//       required this.title,
//       required this.description,
//       required this.color,
//       required this.img,
//       required this.songUrl})
//       : super(key: key);

//   @override
//   _MusicDetailPageState createState() => _MusicDetailPageState();
// }

// class _MusicDetailPageState extends State<MusicDetailPage> {
//   bool isPressed = false;
//   final AudioPlayer audioPlayer = AudioPlayer();

//   Duration? duration;
//   int minutes = 0;
//   int seconds = 0;
//   bool isPlaying = true;
//   double _value = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     // _audioPlayer = AudioPlayer()..setSourceAsset('assets/gym.mp3');
//     // audioPlayer.setAsset('assets/audio/gym.mp3');
//     // audioPlayer.play();
//     // final duration = audioPlayer.duration;
//     // if (duration != null) {
//     //   final durationInSeconds = duration!.inSeconds;
//     //   final minutes = durationInSeconds ~/ 60;
//     //   final seconds = durationInSeconds % 60;
//     //   print('Duração: $minutes minutos e $seconds segundos');
//     // } else {
//     //   print('A duração da música é desconhecida.');
//     // }
//     initializeAudio();
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   Future<void> initializeAudio() async {
//     await audioPlayer.setAsset(widget.songUrl);

//     audioPlayer.durationStream.listen((d) {
//       setState(() {
//         duration = d;
//         final durationInSeconds = duration!.inSeconds;
//         minutes = durationInSeconds ~/ 60;
//         seconds = durationInSeconds % 60;
//       });
//     });

//     audioPlayer.positionStream.listen((p) {
//       setState(() {
//         _value = p.inSeconds.toDouble();
//       });
//     });
//     await audioPlayer.play();
//   }

//   String formatDurationT(int minutes, int seconds) {
//     String formattedMinutes = minutes.toString().padLeft(2, '0');
//     String formattedSeconds = seconds.toString().padLeft(2, '0');
//     return '$formattedMinutes:$formattedSeconds';
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     String formatDuration(Duration duration) {
//       String twoDigits(int n) => n.toString().padLeft(2, '0');

//       String minutes = twoDigits(duration.inMinutes.remainder(60));
//       String seconds = twoDigits(duration.inSeconds.remainder(60));

//       if (duration.inHours > 0) {
//         return '${twoDigits(duration.inHours)}:$minutes:$seconds';
//       } else {
//         return '$minutes:$seconds';
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         titleSpacing: 0.0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.expand_more,
//             color: Colors.black,
//             size: 30,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
//                   child: Container(
//                     width: size.width - 100,
//                     height: size.width - 100,
//                     decoration: BoxDecoration(boxShadow: [
//                       BoxShadow(
//                           // color: Colors.black.withOpacity(0.2),
//                           color: widget.color,
//                           blurRadius: 100,
//                           spreadRadius: 10,
//                           offset: const Offset(20, 20))
//                     ], borderRadius: BorderRadius.circular(20)),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
//                   child: Container(
//                     width: size.width - 5,
//                     height: size.width - 0,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(image: AssetImage(
//                             // 'assets/images/background.jpg'
//                             widget.img), fit: BoxFit.cover),
//                         borderRadius: BorderRadius.circular(5)),
//                   ),
//                 )
//               ],
//             ),
//             Container(
//               alignment: Alignment.center,
//               // color: Colors.blueGrey,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 0, right: 0),
//                 child: Container(
//                   alignment: Alignment.center,
//                   // color: Colors.blueGrey,
//                   child: SizedBox(
//                     width: size.width - 20,
//                     // height: 55,
//                     // color: Colors.blueGrey,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // nome do artista e da msuica
//                         Padding(
//                           // padding: const EdgeInsets.only( left: 10, right: 10, top: 10, bottom: 0),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 5, vertical: 8),
//                           child: Column(
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 150,
//                                 child: Text(
//                                   // "StarBoy",
//                                   widget.title,
//                                   style: const TextStyle(
//                                     fontSize: 22,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 150,
//                                 child: Text(
//                                   // "Wizkid",
//                                   widget.description,
//                                   maxLines: 1,
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.black.withOpacity(0.5),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Like
//                         // Material(
//                         //   color: Colors.transparent,
//                         //   // child: Ink( shuffle, skip_back, controller_stop e play skip_forward e retweet
//                         //   child: Align(
//                         //     alignment: Alignment.center,
//                         //     child: Padding(
//                         //       padding: const EdgeInsets.only(
//                         //           right: 0,
//                         //           top: 0,
//                         //           bottom: 0,
//                         //           left:
//                         //               0), // Adjust the padding values as needed
//                         //       child: IconButton(
//                         //         onPressed: () {
//                         //           setState(() {
//                         //             isPressed = !isPressed;
//                         //             // print(isPressed);
//                         //           });
//                         //         },
//                         //         iconSize: 35,
//                         //         icon: Icon(
//                         //           isPressed
//                         //               ? Icons.favorite
//                         //               : Icons.favorite_border,
//                         //           color: isPressed ? Colors.red : Colors.black,
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         Material(
//                           color: Colors.transparent,
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 0),
//                               child: TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     isPressed = !isPressed;
//                                   });
//                                 },
//                                 style: ButtonStyle(
//                                   padding: MaterialStateProperty.all<
//                                       EdgeInsetsGeometry>(EdgeInsets.zero),
//                                   shape:
//                                       MaterialStateProperty.all<OutlinedBorder>(
//                                           CircleBorder()),
//                                   minimumSize: MaterialStateProperty.all<Size>(
//                                       Size(35, 35)),
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.transparent),
//                                   elevation: MaterialStateProperty.all<double>(
//                                       0), // Set elevation to 0
//                                 ),
//                                 child: Icon(
//                                   isPressed
//                                       ? Icons.favorite
//                                       : Icons.favorite_border,
//                                   color: isPressed ? Colors.red : Colors.black,
//                                   size: 35,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             StatefulBuilder(builder: (context, state) {
//               return Column(
//                 children: [
//                   Container(
//                     // color: Colors.grey
//                     //     .withOpacity(0.2), // Define a cor de fundo desejada
//                     padding: const EdgeInsets.only(
//                         left: 10, right: 10, top: 10, bottom: 2),
//                     child: SliderTheme(
//                       data: SliderTheme.of(context).copyWith(
//                         trackHeight:
//                             2, // Defina a espessura desejada para o slider
//                         thumbShape: const RoundSliderThumbShape(
//                           enabledThumbRadius: 5, // Tamanho do círculo
//                         ),
//                         overlayShape: const RoundSliderOverlayShape(
//                           overlayRadius: 1, // Tamanho da sobreposição
//                         ),
//                         activeTrackColor: Colors.blue, // Cor da barra ativa
//                         inactiveTrackColor: Colors.grey, // Cor da barra inativa
//                         thumbColor:
//                             Colors.red, // Cor do círculo do controle deslizante
//                         overlayColor: Colors.green.withOpacity(
//                             0.4), // Cor da sobreposição ao arrastar o controle deslizante
//                         activeTickMarkColor:
//                             Colors.black, // Cor das marcas de escala ativas
//                         inactiveTickMarkColor:
//                             Colors.grey, // Cor das marcas de escala inativas
//                         valueIndicatorColor:
//                             Colors.yellow, // Cor do indicador de valor
//                         showValueIndicator: ShowValueIndicator
//                             .always, // Exibir indicador de valor
//                         valueIndicatorShape:
//                             const PaddleSliderValueIndicatorShape(), // Forma do indicador de valor
//                         valueIndicatorTextStyle: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                         ), // Estilo do texto do indicador de valor
//                       ),
//                       child: Slider(
//                         // activeColor: Colors.black,
//                         value: _value.toDouble(),
//                         min: 0,
//                         max: duration != null
//                             ? duration!.inSeconds.toDouble()
//                             : 0,
//                         onChanged: (double value) {
//                           setState(() {
//                             _value = value;
//                             audioPlayer.seek(Duration(seconds: _value.toInt()));
//                           });
//                         },
//                         label:
//                             formatDuration(Duration(seconds: _value.toInt())),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           formatDuration(Duration(seconds: _value.toInt())),
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.black.withOpacity(0.5),
//                           ),
//                         ),
//                         Text(
//                           formatDurationT(minutes, seconds),
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.black.withOpacity(0.5),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     // color: Colors.teal, // Substitua pela cor desejada
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             // Lógica para lidar com o botão de embaralhar
//                           },
//                           icon: const Icon(size: 30, Icons.shuffle),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             // Lógica para lidar com o botão de voltar
//                           },
//                           icon: const Icon(size: 30, Icons.skip_previous),
//                         ),
//                         IconButton(
//                           iconSize: 70,
//                           icon: Container(
//                             decoration: BoxDecoration(
//                               // shape: BoxShape.circle,
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             child: Center(
//                               child: Icon(
//                                 isPlaying ? Icons.pause : Icons.play_arrow,
//                                 size: 50,
//                                 // Icons.pause,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             isPlaying
//                                 ? audioPlayer.pause()
//                                 : audioPlayer.play();
//                             setState(() {
//                               isPlaying = !isPlaying;
//                             });
//                           },
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             // Lógica para lidar com o botão de avançar
//                           },
//                           icon: const Icon(size: 30, Icons.skip_next),
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             // Lógica para lidar com o botão de retweet
//                           },
//                           icon: const Icon(size: 30, Icons.repeat),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }),
//             const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Icon(
//                 //arro down
//                 Icons.arrow_downward,
//                 color: Colors.black,
//                 size: 30,
//               ),
//               Text(
//                 "Swipe down to minimize",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ])
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LibraryPage extends StatefulWidget {
//   const LibraryPage({Key? key}) : super(key: key);

//   @override
//   _LibraryPageState createState() => _LibraryPageState();
// }

// class _LibraryPageState extends State<LibraryPage> {
//   List<String> results = [];
//   bool isList = true;

//   List<Album> libraryData = [
//     Album(
//       name: "StarBoy 1",
//       imageUrl: "assets/images/3.jpg",
//     ),
//     Album(
//       name: "StarBoy 2",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 3",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 4",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 5",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 1",
//       imageUrl: "assets/images/3.jpg",
//     ),
//     Album(
//       name: "StarBoy 2",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 3",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 4",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 5",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 1",
//       imageUrl: "assets/images/3.jpg",
//     ),
//     Album(
//       name: "StarBoy 2",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 3",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 4",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     Album(
//       name: "StarBoy 5",
//       imageUrl: "assets/images/background.jpg",
//     ),
//     // Adicione mais álbuns conforme necessário
//   ];

//   void _createPlaylist() {}

//   @override
//   Widget build(BuildContext context) {
//     // var size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0, // Remover sombra da AppBar
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false, // Remover botão de retorno
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/images/playstore.png',
//               width: 32,
//               height: 32,
//             ),
//             const SizedBox(width: 8),
//             const Text(
//               'Library',
//               style: TextStyle(fontSize: 20, color: Colors.black),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.search,
//               color: Colors.black,
//               size: 30,
//             ),
//             onPressed: () {
//               // Lógica para o botão de pesquisa
//             },
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//       // body: Text("Library"),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 40,
//                         child: ListView(
//                           padding: EdgeInsets.zero,
//                           scrollDirection: Axis.horizontal,
//                           children: [
//                             const SizedBox(width: 15),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Ação quando o botão "Albums" é pressionado
//                               },
//                               style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 8),
//                                 ),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.black),
//                                 shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     side: const BorderSide(color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               child: const Text('Albums'),
//                             ),
//                             const SizedBox(width: 5),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Ação quando o botão "Artistas" é pressionado
//                               },
//                               style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 8),
//                                 ),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.black),
//                                 shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     side: const BorderSide(color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               child: const Text('Artistas'),
//                             ),
//                             const SizedBox(width: 5),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Ação quando o botão "Músicas" é pressionado
//                               },
//                               style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 8),
//                                 ),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.black),
//                                 shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     side: const BorderSide(color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               child: const Text('Músicas'),
//                             ),
//                             const SizedBox(width: 5),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Ação quando o botão "Playlists" é pressionado
//                               },
//                               style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 8),
//                                 ),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.black),
//                                 shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     side: const BorderSide(color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               child: const Text('Playlists'),
//                             ),
//                             const SizedBox(width: 5),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // Ação quando o botão "Playlists" é pressionado
//                               },
//                               style: ButtonStyle(
//                                 padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 8),
//                                 ),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white),
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.black),
//                                 shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                     side: const BorderSide(color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               child: const Text('Playlists'),
//                             ),
//                             const SizedBox(width: 5),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 8),
//                             child: Row(
//                               children: [
//                                 SizedBox(width: 5),
//                                 Icon(Icons.sort, color: Colors.black),
//                                 SizedBox(width: 12),
//                                 Text(
//                                   "Recent Added",
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isList = !isList;
//                                   });
//                                 },
//                                 child: Icon(
//                                   isList ? Icons.list : Icons.grid_view_rounded,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               const SizedBox(width: 14),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Visibility(
//                         visible:
//                             isList, // Define a visibilidade com base no valor de isList
//                         child: SingleChildScrollView(
//                           child: Container(
//                             // color: Colors.blue,
//                             height: MediaQuery.of(context).size.height * 0.65,
//                             child: GridView.builder(
//                               shrinkWrap: true,
//                               padding: const EdgeInsets.only(
//                                   left: 14, right: 10, top: 10, bottom: 10),
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 3, // Número de colunas desejado
//                                 crossAxisSpacing:
//                                     5, // Espaçamento entre as colunas
//                                 mainAxisSpacing:
//                                     5, // Espaçamento entre as linhas
//                                 mainAxisExtent: 150, // Altura das linhas
//                               ),
//                               itemCount: libraryData.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 final data = libraryData[index];
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => MusicDetailPage(
//                                           title: data.name,
//                                           description: "Wizkid",
//                                           color: Colors.black,
//                                           img: data.imageUrl,
//                                           songUrl: "assets/audio/gym.mp3",
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     child: Column(
//                                       children: [
//                                         ClipRect(
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                             child: Image.asset(
//                                               data.imageUrl,
//                                               fit: BoxFit.cover,
//                                               height: 100,
//                                               width: 100,
//                                             ),
//                                           ),
//                                         ),
//                                         const Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 0.0,
//                                               top: 2.0,
//                                               bottom: 1.0,
//                                               right: 1.0),
//                                           child: Text(
//                                             'Título da Legenda',
//                                             style: TextStyle(
//                                               fontSize: 13,
//                                               fontWeight: FontWeight.bold,
//                                               // letterSpacing: -0.4,
//                                             ),
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 1,
//                                             softWrap: false,
//                                           ),
//                                         ),
//                                         const Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 0.0,
//                                               top: 2.0,
//                                               bottom: 1.0,
//                                               right: 1.0),
//                                           child: Text(
//                                             'Subtítulo da Legenda',
//                                             style: TextStyle(
//                                               fontSize: 11,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey,
//                                               // letterSpacing: -0.4,
//                                             ),
//                                             overflow: TextOverflow.ellipsis,
//                                             maxLines: 2,
//                                             softWrap: false,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       Visibility(
//                         visible:
                            // // !isList, // Define a visibilidade com base no valor inverso de isList
//                         child: SingleChildScrollView(
//                           child: Container(
//                             // color: Colors.amber,
//                             // width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height * 0.65,
//                             padding: const EdgeInsets.only(
//                                 left: 0, right: 0, top: 0, bottom: 0),
//                             child: ListView.builder(
//                               itemCount: libraryData.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 final data = libraryData[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 6.0),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => MusicDetailPage(
//                                             title: data.name,
//                                             description: "Wizkid",
//                                             color: Colors.black,
//                                             img: data.imageUrl,
//                                             songUrl: "assets/audio/gym.mp3",
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     child: Container(
//                                       // color: Colors.red,
//                                       margin: const EdgeInsets.only(
//                                           left: 14, right: 14),
//                                       // padding: const EdgeInsets.all(2),
//                                       decoration: BoxDecoration(
//                                         color: Colors.grey[200],
//                                         borderRadius: BorderRadius.circular(4),
//                                         // border: Border.all(
//                                         //   color: Colors.black,
//                                         //   width: 0.1,
//                                         // ),
//                                       ),
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(0),
//                                             child: Image.asset(
//                                               data.imageUrl,
//                                               fit: BoxFit.cover,
//                                               height: 70,
//                                               width: 70,
//                                             ),
//                                           ),
//                                           const SizedBox(width: 10),
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   data.name,
//                                                   style: const TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 4),
//                                                 const Text(
//                                                   "data.description",
//                                                   style: TextStyle(
//                                                     fontSize: 14,
//                                                     color: Colors.grey,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 5, // Vertical position
//             right: 10, // Horizontal position
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => NewPlaylistPage(),
//                   ),
//                 );
//               },
//               child: Container(
//                 width: 145,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Colors.black),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.add,
//                       color: Colors.black,
//                     ),
//                     SizedBox(width: 5),
//                     Text(
//                       'New Playlist',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: const Color.fromARGB(75, 70, 70, 70),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           child: GNav(
//             // backgroundColor: Color.fromARGB(0, 136, 136, 136),
//             // rippleColor: Color.fromARGB(255, 226, 0, 0),
//             // hoverColor: Color.fromARGB(255, 0, 255, 13),
//             color: Colors.black,
//             activeColor: Color.fromARGB(255, 214, 214, 214),
//             // tabActiveBorder:
//             //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
//             tabBackgroundColor: Colors.black,
//             // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
//             // selectedIndex: _selectedIndex, 0
//             gap: 6,
//             iconSize: 24,
//             // selectedIndex: 0,
//             selectedIndex: 2,
//             onTabChange: (index) {
//               // print(index);

//               if (index == 0) {
//                 Navigator.pushReplacementNamed(context, '/home');
//               } else if (index == 1) {
//                 Navigator.pushReplacementNamed(context, '/search');
//               } else if (index == 2) {
//                 Navigator.pushReplacementNamed(context, '/library');
//               } else if (index == 3) {
//                 Navigator.pushReplacementNamed(context, '/profile');
//               }
//             },
//             tabs: [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Home',
//                 // height: 100.0,
//               ),
//               GButton(
//                 icon: Icons.search,
//                 text: 'Search',
//               ),
//               GButton(
//                 icon: Icons.library_books,
//                 text: 'Library',
//               ),
//               GButton(
//                 icon: Icons.person,
//                 text: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NewPlaylistPage extends StatefulWidget {
//   const NewPlaylistPage({Key? key}) : super(key: key);

//   @override
//   _NewPlaylistPageState createState() => _NewPlaylistPageState();
// }

// class _NewPlaylistPageState extends State<NewPlaylistPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // butao no centro e uma lista por debaixo
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Container(
//                 color: Colors.transparent,
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         // Lógica para fazer upload de uma imagem
//                         // Implemente aqui a funcionalidade de upload da imagem
//                         print("Upload");
//                       },
//                       child: Stack(
//                         children: [
//                           const CircleAvatar(
//                             radius: 50,
//                             // backgroundColor: Colors.grey,
//                             backgroundImage:
//                                 AssetImage('assets/images/funny.jpg'),
//                           ),
//                           Container(
//                             height: 100,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.black.withOpacity(
//                                   0.5), // Adiciona uma camada de opacidade preta
//                             ),
//                             child: const Icon(
//                               Icons.camera_alt,
//                               color: Colors.white,
//                               size: 40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // const Text(
//                     //   'New Playlist',
//                     //   style: TextStyle(
//                     //     fontSize: 24,
//                     //     fontWeight: FontWeight.bold,
//                     //   ),
//                     // ),
//                     const SizedBox(height: 5),
//                     const Text(
//                       'Give your playlist a name',
//                       style: TextStyle(
//                         fontSize: 20,
//                         // color: Colors.grey,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Container(
//                       // color: Colors.amber,
//                       margin: const EdgeInsets.symmetric(horizontal: 40),
//                       // padding: EdgeInsets.symmetric(vertical: -5.0),
//                       child: const TextField(
//                         style: TextStyle(
//                           fontSize: 20,
//                           // decoration: TextDecoration
//                           //     .none, // Remove qualquer decoração existente
//                           // decorationStyle: null,
//                           // decorationStyle: TextDecorationStyle.solid,
//                         ), // Define o tamanho da fonte como 20

//                         decoration: InputDecoration(
//                           hintText: 'Playlist name',
//                           hintStyle: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey,
//                           ),
//                           contentPadding: EdgeInsets.only(left: 10.0),
//                           // enabledBorder: UnderlineInputBorder(
//                           //   borderSide:
//                           //       BorderSide.none, // Removes the underline
//                           // ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey,
//                               width: 1.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(right: 5.0),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Lógica para cancelar (back)
//                               Navigator.pop(context);
//                             },
//                             style: ElevatedButton.styleFrom(
//                               elevation: 0, // Remove a sombra
//                               minimumSize: const Size(
//                                   120, 50), // Aumenta o tamanho do botão
//                               backgroundColor: Colors.white,
//                               foregroundColor: Colors.black,
//                               side: BorderSide(color: Colors.black, width: 0.5),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                     40.0), // Define o raio de arredondamento
//                               ),
//                             ),
//                             child: Text('Cancelar'),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(left: 5.0),
//                           child: ElevatedButton(
//                             onPressed: () {
//                               // Lógica para Criar (aaddicionar playlist)
//                             },
//                             style: ElevatedButton.styleFrom(
//                               elevation: 0, // Remove a sombra
//                               minimumSize:
//                                   Size(100, 50), // Aumenta o tamanho do botão
//                               backgroundColor: Colors.blue[900],
//                               foregroundColor: Colors.white,
//                               // side: BorderSide(color: Colors.black, width: 1.0),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(
//                                     40.0), // Define o raio de arredondamento
//                               ),
//                             ),
//                             child: Text('Criar'),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // / / / / / / / / / / / / / / / / / / / / / / / /

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     final marginHeight = MediaQuery.of(context).size.height * 0.3;

//     return Scaffold(
//       body: Container(
//         // color: Colors.black.withOpacity(0.5),
//         child: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/background.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: marginHeight),
//               color: Colors.white.withOpacity(0.9),
//               padding: EdgeInsets.only(left: 14, top: 5, bottom: 5, right: 14),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     color: Colors.amber.withOpacity(0.9),
//                     width: 90,
//                     padding: const EdgeInsets.only(
//                         left: 0, top: 0, bottom: 0, right: 0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage(
//                             'assets/images/background.jpg',
//                           ),
//                           radius: 38,
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           'TheWeenkend',
//                           style: TextStyle(
//                             fontSize: 12,
//                             // fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Colors.blue.withOpacity(0.9),
//                     // width: 90,
//                     padding: const EdgeInsets.only(
//                         left: 10, top: 10, bottom: 0, right: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   '2.9M',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     // fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   'followers',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     // fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(width: 5),
//                             Column(
//                               children: [
//                                 Text(
//                                   '5.9',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   'rating',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     // fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(width: 5),
//                             Column(
//                               children: [
//                                 Text(
//                                   '2.9M',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     // fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   'followers',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     // fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           // descricao
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Lorem ipsum dolor sit amet . \n Lorem ipsum dolor sit amet .',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 // fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: const Color.fromARGB(75, 70, 70, 70),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//           child: GNav(
//             // backgroundColor: Color.fromARGB(0, 136, 136, 136),
//             // rippleColor: Color.fromARGB(255, 226, 0, 0),
//             // hoverColor: Color.fromARGB(255, 0, 255, 13),
//             color: Colors.black,
//             activeColor: Color.fromARGB(255, 214, 214, 214),
//             // tabActiveBorder:
//             //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
//             tabBackgroundColor: Colors.black,
//             // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
//             // selectedIndex: _selectedIndex, 0
//             gap: 6,
//             iconSize: 24,
//             // selectedIndex: 0,
//             selectedIndex: 3,
//             onTabChange: (index) {
//               // print(index);

//               if (index == 0) {
//                 Navigator.pushReplacementNamed(context, '/home');
//               } else if (index == 1) {
//                 Navigator.pushReplacementNamed(context, '/search');
//               } else if (index == 2) {
//                 Navigator.pushReplacementNamed(context, '/library');
//               } else if (index == 3) {
//                 Navigator.pushReplacementNamed(context, '/profile');
//               }
//             },
//             tabs: [
//               GButton(
//                 icon: Icons.home,
//                 text: 'Home',
//                 // height: 100.0,
//               ),
//               GButton(
//                 icon: Icons.search,
//                 text: 'Search',
//               ),
//               GButton(
//                 icon: Icons.library_books,
//                 text: 'Library',
//               ),
//               GButton(
//                 icon: Icons.person,
//                 text: 'Profile',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AudioPlayerSreen extends StatefulWidget {
//   const AudioPlayerSreen({Key? key}) : super(key: key);

//   @override
//   _AudioPlayerSreenState createState() => _AudioPlayerSreenState();
// }

// class _AudioPlayerSreenState extends State<AudioPlayerSreen> {
//   late AudioPlayer _audioPlayer;

//   @override
//   void initState() {
//     super.initState();
//     // _audioPlayer = AudioPlayer()..setSourceAsset('assets/gym.mp3');
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(213, 143, 18, 18),
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.keyboard_arrow_down_rounded,
//               color: Colors.black),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color.fromARGB(63, 216, 28, 28),
//             Color.fromARGB(70, 47, 1, 231),
//           ],
//         )),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [],
//         ),
//       ),
//     );
//   }
// }

// // CustomSearchDelegate IMPORTANTE, mas nao utilizado
// class CustomSearchDelegate extends SearchDelegate {
//   List<String> searchTerms = [
//     'Aearch term 1',
//     'Aearch term 2',
//     'Aearch term 3',
//     'Bearch term 4',
//     'Bearch term 5',
//     'Bearch term 6',
//     'Bearch term 7',
//     'Search term 8',
//     'Search term 9',
//     'Search term 10',
//     'Search term 11',
//     'Search term 12',
//     'Search term 13',
//     'Search term 14',
//     'Search term 15',
//     'Search term 16',
//     'Search term 17',
//     'Search term 18',
//     'Search term 19',
//     'Search term 20',
//     'Search term 21',
//   ];

//   // @override
//   // AppBar buildAppBar(BuildContext context) {
//   //   return AppBar(
//   //     backgroundColor: Colors.black, // Altera a cor de fundo para preto
//   //     elevation: 0, // Remove a sombra da AppBar
//   //     // Adicione outras propriedades personalizadas desejadas para a AppBar
//   //     // ...
//   //     actions: buildActions(context),
//   //     leading: buildLeading(context),
//   //     // title: buildSearchField(context),
//   //   );
//   // }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear, color: Colors.black),
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Navigator.pop(context);
//         // close(context, null);
//       },
//       // icon: const Icon(Icons.arrow_back),
//       icon: const Icon(
//         Icons.arrow_back_ios,
//         color: Colors.black,
//       ),
//     );
//   }

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       appBarTheme: const AppBarTheme(
//         elevation: 0, // Remove a sombra da AppBar
//         color: Color.fromARGB(
//             0, 178, 178, 178), // Define a cor da AppBar como transparente
//         // brightness: Brightness.dark, // Define o brilho da AppBar como escuro
//         // Adicione outras propriedades personalizadas desejadas para a AppBar
//       ),
//       inputDecorationTheme: const InputDecorationTheme(
//         border: InputBorder.none, // Remove a borda do TextField
//       ),
//       textTheme: ThemeData.dark().textTheme.copyWith(
//             headline6: const TextStyle(
//               fontSize: 20, // Define o tamanho da fonte do título
//               fontWeight: FontWeight.bold, // Define o peso da fonte do título
//               color: Color.fromARGB(255, 226, 11, 11), // Define a cor do título
//               decoration: TextDecoration.none, // Remove o sublinhado do texto
//             ),
//           ),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Center(
//         child: Text(query),
//         // Utilizar a quary para redirecionar user
//         // + ' ' + context.toString()
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final List<String> suggestionList = query.isEmpty
//         ? searchTerms
//         : searchTerms
//             .where((element) =>
//                 element.toLowerCase().startsWith(query.toLowerCase()))
//             .toList();

//     return ListView.builder(
//       itemCount: suggestionList.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           onTap: () {
//             query = suggestionList[index];
//             showResults(context);
//           },
//           // cada resultado???
//           leading: const Icon(Icons.search),
//           title: RichText(
//             text: TextSpan(
//               text: suggestionList[index].substring(0, query.length),
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//               children: [
//                 TextSpan(
//                   text: suggestionList[index].substring(query.length),
//                   style: const TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class MusicPlayerPage extends StatelessWidget {
//   final String musicTitle;
//   final String musicCoverImage;

//   const MusicPlayerPage({
//     Key? key,
//     required this.musicTitle,
//     required this.musicCoverImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         titleSpacing: 0.0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         //   title: Text(musicTitle,
//         //       style: const TextStyle(
//         //         color: Colors.black,
//         //         fontWeight: FontWeight.bold,
//         //         backgroundColor: Colors.red,
//         //       )),
//       ),
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Image.network(musicCoverImage),
//           Image(
//             image: AssetImage(musicCoverImage),
//             // image: AssetImage('assets/icons/google.png'),
//             fit: BoxFit.cover,
//             height: 250,
//             width: 250,
//             // color: Colors.black,
//             // colorBlendMode: BlendMode.darken,

//             // For asset images
//           ),
//           const SizedBox(height: 20),
//           // const Text('${musicTitle}]'),

//           // Add music player controls here (e.g., play/pause buttons, seek bar, etc.)
//         ],
//       ),
//     );
//   }
// }
