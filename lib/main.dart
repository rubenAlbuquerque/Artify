/*
import 'package:artify/route_generator.dart';
import 'package:flutter/material.dart';
// import './screens/login-page.dart';
import './screens/home_page.dart';

void main() {
  runApp(const MyApp());
  // build\app\outputs\flutter-apk\app-debug.apk
}

// MyHomePage
class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.amber,
          ),
      home: const MyHomePage(),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,

      // bottomNavigationBar: BottomNavigationBar(
      //   // color da barra de navegação
      //   backgroundColor: Colors.blue,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profil',
      //     ),
      //   ],
      //   // currentIndex: _selectedIndex,
      //   selectedItemColor: Color.fromARGB(255, 255, 0, 0)     // onTap: _onItemTapped,
      // ),
    );
  }
}

// fitterBox - child do tamanho do parent
// splash screen
silverAppBar corre com o scrooll
Size size = MediaQuery.of(context).size
double height = size.height
double width = size.width

selectableText

iconButon -> AnimatedIcon
laucher icon

*/

import 'package:flutter/material.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
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

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // add background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(122, 0, 0, 0), BlendMode.darken),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // add a text
              const Text(
                'As tuas musicas \n no Artify',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  // text align center
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // add a button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  // SignInButton(
                  //   Buttons.Google,
                  //   onPressed: () {
                  //     // Lógica de autenticação com o Google aqui
                  //     Navigator.pushReplacementNamed(context, '/home');
                  //   },
                  // ),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  fixedSize: const Size(200, 40),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/icons/google.png'),
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Login with Google',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text(
        //       'Bem-vindo!',
        //       style: TextStyle(
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     const SizedBox(height: 16),
        //     SignInButton(
        //       Buttons.Google,
        //       onPressed: () {
        //         // Lógica de autenticação com o Google aqui
        //         Navigator.pushReplacementNamed(context, '/home');
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class Story {
  final String imageUrl;
  final String username;

  Story({
    required this.imageUrl,
    required this.username,
  });
}

class Post {
  final String userImageUrl;
  final String username;
  final String description;

  final String date;
  final String largeImageUrl;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.userImageUrl,
    required this.username,
    required this.description,
    required this.date,
    required this.largeImageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  // int _selectedIndex = 0;

  late List<Story> stories;
  late List<Post> posts; // Adicione a declaração da lista de posts
  late Timer timer;
  bool mounted = true;

  List<Story> generateStories(int count) {
    List<Story> stories = [];
    for (int i = 0; i < count; i++) {
      stories.add(
        Story(
          imageUrl: 'https://via.placeholder.com/150',
          username: 'User $i',
        ),
      );
    }
    return stories;
  }

  List<Post> generatePosts(int count) {
    List<Post> posts = [];
    for (int i = 0; i < count; i++) {
      posts.add(
        Post(
          userImageUrl: 'https://via.placeholder.com/50',
          username: 'User $i',
          description: 'This is post number $i',
          date: '$i June 2021',
          // Defina a data de publicação desejada
          largeImageUrl:
              'https://via.placeholder.com/500', // URL da foto em tamanho grande
          likes: 20, // Número de curtidas inicial
          comments: 30, // Número de comentários inicial
          shares: 50,
        ),
      );
    }

    return posts;
  }

  @override
  void initState() {
    super.initState();
    stories = generateStories(5); // Defina o número de histórias desejado
    posts = generatePosts(10); // Defina o número de posts desejado

    // timer = Timer.periodic(const Duration(seconds: 60), (Timer t) {
    //   if (!mounted) {
    //     timer.cancel();
    //   } else {
    //     setState(() {});
    //   }
    // });
  }

  // late var timer;
  // void initState() {
  //   super.initState();
  //   // fetchDataVip();
  //   Timer.periodic(const Duration(seconds: 60), (Timer t) {
  //     if (!mounted) {
  //       timer.cancel();
  //     } else {
  //       setState(() {});
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }

  void _handleTabChange(int index) {
    // if (mounted) {
    // setState(() {
    // Lógica de alteração de guia aqui
    // index;
    // onTabChange: (index) {
    // print(index);

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/search');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/library');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
    // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // Remover sombra da AppBar
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remover botão de retorno
        title: Row(
          children: [
            Image.asset(
              'assets/images/playstore.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            const Text(
              'Artify',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.upload, color: Colors.black),
            onPressed: () {
              // Lógica para o botão de upload
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Lógica para o botão de notificações
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Lógica para o botão de perfil
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Widget para exibir as histórias
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                // Aqui você pode construir cada item de história (story) com base nos dados disponíveis
                // Pode usar o widget CircleAvatar para exibir a imagem do usuário
                // Pode adicionar um nome de usuário ou outros detalhes abaixo da imagem
                return Container(
                  width: 80,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 10,
                  ),
                  // Ajuste as margens horizontais para reduzir o espaçamento entre os itens
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(stories[index].imageUrl),
                      ),
                      // const SizedBox(height: 2),
                      Text(stories[index].username),
                    ],
                  ),
                );
              },
            ),
          ),

          // Widget para exibir as publicações
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              // Extrair os dados do post atual
              final post = posts[index];

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(post.userImageUrl),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.username,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              post.date,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Exibir a foto em tamanho grande
                  Stack(
                    children: [
                      Image.network(post.largeImageUrl),
                      Positioned(
                        left: 10,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Container(
                            // width: 200,
                            padding: const EdgeInsets.all(8),
                            color: Colors.black.withOpacity(0.3),

                            width: MediaQuery.of(context).size.width * 0.9,

                            child: Text(
                              post.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.favorite,
                                    color: Colors.red, size: 30),
                                const SizedBox(width: 2),
                                Text('${post.likes}'),
                              ],
                            ),
                            const SizedBox(width: 14),
                            Row(
                              children: [
                                const Icon(Icons.comment,
                                    color: Colors.blue, size: 30),
                                const SizedBox(width: 2),
                                Text('${post.comments}'),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                const Icon(Icons.share,
                                    color: Colors.green, size: 30),
                                const SizedBox(width: 2),
                                Text(' ${post.shares}'),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                iconSize: 24,
                                // padding: const EdgeInsets.all(5),
                                onPressed: () {
                                  // Lógica para adicionar ação
                                },
                              ),
                            ],
                          ),
                        ),
                        // Spacer(), // Adiciona um espaço flexível para empurrar o botão "add" para a direita
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(75, 70, 70, 70),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: GNav(
            // backgroundColor: Color.fromARGB(0, 136, 136, 136),
            // rippleColor: Color.fromARGB(255, 226, 0, 0),
            // hoverColor: Color.fromARGB(255, 0, 255, 13),
            color: Colors.black,
            activeColor: const Color.fromARGB(255, 214, 214, 214),
            // tabActiveBorder:
            //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
            tabBackgroundColor: Colors.black,
            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            // selectedIndex: _selectedIndex, 0
            gap: 6,
            iconSize: 24,
            // selectedIndex: 0,
            // selectedIndex: _selectedIndex, // Set the initial selected index
            onTabChange: _handleTabChange, // Set the onTabChange callback

            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                // height: 100.0,
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Library',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  late Timer timer;
  bool mounted = true;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false, // Remover botão de retorno
        backgroundColor: Colors.transparent,
        // Color.fromARGB(244, 201, 15, 15), // Remover o background azul
        elevation: 0, // Remover a sombra
        title: const Padding(
          // padding: EdgeInsets.symmetric(horizontal: 2, vertical: 50),
          padding: EdgeInsets.only(top: 20, bottom: 0),

          // Adicionar padding horizontal
          child: TextField(
            // controller: _searchController,
            // focusNode: _searchFocusNode,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done, //.search,

            decoration: InputDecoration(
              hintText: 'Search..',
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                // fontWeight: FontWeight.bold
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: 36,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          color: Colors.grey[400],
          // padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Albums" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: const Text('Albums'),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Artistas" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: const Text('Artistas'),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Músicas" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: const Text('Músicas'),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Playlists" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: const Text('Playlists'),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Playlists" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: const Text('Playlists'),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Align(
                  alignment: Alignment.centerLeft, // Alinhar à esquerda
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    // Adicionar padding vertical
                    child: Text(
                      'New Albums',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, //albums.length,
                  // Substitua "albums.length" pela quantidade real
                  itemBuilder: (BuildContext context, int index) {
                    // final album = albums[index];
                    return Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/background.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'album.name',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(75, 70, 70, 70),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: GNav(
            // backgroundColor: Color.fromARGB(0, 136, 136, 136),
            // rippleColor: Color.fromARGB(255, 226, 0, 0),
            // hoverColor: Color.fromARGB(255, 0, 255, 13),
            color: Colors.black,
            activeColor: Color.fromARGB(255, 214, 214, 214),
            // tabActiveBorder:
            //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
            tabBackgroundColor: Colors.black,
            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            // selectedIndex: _selectedIndex, 0
            gap: 6,
            iconSize: 24,
            // selectedIndex: 0,
            selectedIndex: 1,
            onTabChange: (index) {
              // print(index);

              if (index == 0) {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (index == 1) {
                Navigator.pushReplacementNamed(context, '/search');
              } else if (index == 2) {
                Navigator.pushReplacementNamed(context, '/library');
              } else if (index == 3) {
                Navigator.pushReplacementNamed(context, '/profile');
              }
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                // height: 100.0,
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Library',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, // Remover botão de retorno
          title: const Text('Library')),
      body: const Center(
        child: Text(
          'Library',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(75, 70, 70, 70),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: GNav(
            // backgroundColor: Color.fromARGB(0, 136, 136, 136),
            // rippleColor: Color.fromARGB(255, 226, 0, 0),
            // hoverColor: Color.fromARGB(255, 0, 255, 13),
            color: Colors.black,
            activeColor: Color.fromARGB(255, 214, 214, 214),
            // tabActiveBorder:
            //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
            tabBackgroundColor: Colors.black,
            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            // selectedIndex: _selectedIndex, 0
            gap: 6,
            iconSize: 24,
            // selectedIndex: 0,
            selectedIndex: 2,
            onTabChange: (index) {
              // print(index);

              if (index == 0) {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (index == 1) {
                Navigator.pushReplacementNamed(context, '/search');
              } else if (index == 2) {
                Navigator.pushReplacementNamed(context, '/library');
              } else if (index == 3) {
                Navigator.pushReplacementNamed(context, '/profile');
              }
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                // height: 100.0,
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Library',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, // Remover botão de retorno
          title: const Text('Profile')),
      body: const Center(
        child: Text(
          'Profile',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(75, 70, 70, 70),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: GNav(
            // backgroundColor: Color.fromARGB(0, 136, 136, 136),
            // rippleColor: Color.fromARGB(255, 226, 0, 0),
            // hoverColor: Color.fromARGB(255, 0, 255, 13),
            color: Colors.black,
            activeColor: Color.fromARGB(255, 214, 214, 214),
            // tabActiveBorder:
            //     Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 1),
            tabBackgroundColor: Colors.black,
            // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            // selectedIndex: _selectedIndex, 0
            gap: 6,
            iconSize: 24,
            // selectedIndex: 0,
            selectedIndex: 3,
            onTabChange: (index) {
              // print(index);

              if (index == 0) {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (index == 1) {
                Navigator.pushReplacementNamed(context, '/search');
              } else if (index == 2) {
                Navigator.pushReplacementNamed(context, '/library');
              } else if (index == 3) {
                Navigator.pushReplacementNamed(context, '/profile');
              }
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                // height: 100.0,
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Library',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
