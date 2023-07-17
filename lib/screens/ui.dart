import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:artify/models/models.dart';

import '../services/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/scheduler.dart';

import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Future<void> _signInWithGoogle(BuildContext context) async {
  //   final userCredential = await AuthService().signInWithGoogle();
  //   print("userCredential");
  //   print(userCredential);
  //   if (userCredential != null) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePage()),
  //     );
  //     // navigatorKey.currentState!.push(
  //     //   MaterialPageRoute(builder: (context) => const HomePage()),
  //     // );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('E-mail não verificado'),
  //           content: const Text(
  //               'Por favor, verifique seu e-mail antes de fazer login.'),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               child: const Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }
  Future<void> _signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn? googlesignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googlesignIn!.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // // obtain the auth details from the request
    // final GoogleSignInAuthentication googleAuth =
    //     await googleUser!.authentication;

    // // obtain google sign in credentials
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    // // sign in to firebase with google credentials
    // await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                onPressed: () async {
                  // await _signInWithGoogle();
                  await AuthService().signInWithGoogle();

                  if (mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                // onPressed: () {
                //   AuthService().signInWithGoogle();
                // AuthService().signInWithGoogle().then((userCredential) {
                //   if (userCredential != null) {
                //     // O usuário foi autenticado com sucesso
                //     // Faça algo aqui, como navegar para a próxima tela
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const HomePage()),
                // );
                //   } else {
                //     // Ocorreu um erro durante a autenticação
                //     // Trate o erro ou mostre uma mensagem de erro ao usuário
                //     showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return AlertDialog(
                //           title: const Text('Erro de autenticação'),
                //           content: const Text(
                //               'Não foi possível fazer login com o Google.'),
                //           actions: <Widget>[
                //             ElevatedButton(
                //               child: const Text('OK'),
                //               onPressed: () {
                //                 Navigator.of(context).pop();
                //               },
                //             ),
                //           ],
                //         );
                //       },
                //     );
                //   }
                // });
                // },
                // Lógica de autenticação com o Google aqui
                // final userCredential = AuthService().signInWithGoogle();

                // if (userCredential != null) {
                //   // Navegue para a próxima tela (HomePage, por exemplo)
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const HomePage()),
                //   );
                // } else {
                //   // Mostrar uma mensagem informando que o e-mail não foi verificado
                //   showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         title: const Text('E-mail não verificado'),
                //         content: const Text('Por favor, verifique seu e-mail antes de fazer login.'),
                //         actions: <Widget>[
                //           ElevatedButton(
                //             child: const Text('OK'),
                //             onPressed: () {
                //               Navigator.of(context).pop();
                //             },
                //           ),
                //         ],
                //       );
                //     },
                //   );
                // }
                // AuthService().signInWithGoogle();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomePage()),
                // );
                // SignInButton(
                //   Buttons.Google,
                //   onPressed: () {
                //     // Lógica de autenticação com o Google aqui
                //     Navigator.pushReplacementNamed(context, '/home');
                //   },
                // ),
                // },
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
      ),
    );
  }
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
  // bool mounted = true;

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

  Future<void> logOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    // await FirebaseAuth.instance.signOut();
    // Navigator.pushReplacementNamed(context, '/login');
  }

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
              // UploadPage
              // Navigator.pushReplacementNamed(context, '/upload');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Lógica para o botão de notificações
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              // Lógica para o botão de logout
              await logOut();

              //voltar para o login
              Navigator.pushReplacementNamed(context, '/login');
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

//

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _imageFile;
  File? _audioFile;

  // Reference to Firebase Storage
  // final FirebaseStorage _storage = FirebaseStorage.instance;

  // // Reference to Firebase Firestore
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // // Uploads the image file to Firebase Storage
  // Future<String> _uploadImage(File imageFile) async {
  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //   Reference storageRef = _storage.ref().child('images/$fileName.jpg');
  //   UploadTask uploadTask = storageRef.putFile(imageFile);
  //   TaskSnapshot snapshot = await uploadTask;
  //   String imageUrl = await snapshot.ref.getDownloadURL();
  //   return imageUrl;
  // }

  // // Uploads the audio file to Firebase Firestore
  // Future<void> _uploadAudio(String imageUrl, String audioUrl) async {
  //   await _firestore.collection('music').add({
  //     'image': imageUrl,
  //     'audio': audioUrl,
  //   });
  // }

  // Handles the image selection
  void _pickImage() async {
    //   // Code for selecting an image from the device's gallery
    //   // ...

    //   // After selecting the image
    //   setState(() {
    //     _imageFile = selectedImageFile;
    //   });
    String title = 'Song Title';
    String imageUrl = 'https://example.com/song_image.jpg';
    String description = 'A great song';
    int likes = 0;

    AuthService().uploadMusic(title, imageUrl, description, likes);
    print('Music uploaded successfully');
  }

  // Handles the audio selection
  // void _pickAudio() async {
  //   // Code for selecting an audio file from the device's storage
  //   // ...

  //   // After selecting the audio file
  //   setState(() {
  //     _audioFile = selectedAudioFile;
  //   });
  // }

  // Handles the upload button press
  // void _handleUpload() async {
  //   if (_imageFile != null && _audioFile != null) {
  //     // Upload image to Firebase Storage
  //     String imageUrl = await _uploadImage(_imageFile!);

  //     // Upload audio to Firebase Firestore
  //     String audioUrl = _audioFile!.path; // Placeholder for audio upload logic

  //     await _uploadAudio(imageUrl, audioUrl);

  //     // Clear selected files
  //     setState(() {
  //       _imageFile = null;
  //       _audioFile = null;
  //     });

  //     // Show success message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Upload completed successfully')),
  //     );
  //   } else {
  //     // Show error message if files are not selected
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please select an image and an audio file')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage, //_pickAudio,
              child: Text('Select Audio'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage, //_handleUpload,
              child: Text('Upload'),
            ),
          ],
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
  List<String> results = [];

  List<Album> albums = [
    Album(
      id: "kkkkkkkkkkkkkkkkkkkk1",
      name: "StarBoy 1",
      imageUrl: "assets/images/3.jpg",
    ),
    Album(
      id: "kkkkkkkkkkkkkkkkkkkk2",
      name: "StarBoy 2",
      imageUrl: "assets/images/background.jpg",
    ),
    Album(
      id: "kkkkkkkkkkkkkkkkkkkk2",
      name: "StarBoy 3",
      imageUrl: "assets/images/background.jpg",
    ),
    // Adicione mais álbuns conforme necessário
  ];

  void search() {
    // String searchTerm = _searchController.text;
    // print searchTerm
    // print(searchTerm);
    // Faça aqui a lógica de pesquisa com base no searchTerm e atualize a lista de resultados
    // Neste exemplo, vamos apenas filtrar uma lista de itens
    // List<String> filteredList = albums
    //     .where((album) =>
    //         album.name.toLowerCase().contains(searchTerm.toLowerCase()))
    //     .toList();

    if (mounted) {
      setState(() {
        // results = filteredList;
      });
    }
  }

  late Timer timer;
  // bool mounted = true;

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
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 0, right: 0, left: 0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 4, bottom: 4, left: 15, right: 15),
                child: ElevatedButton(
                  // onPressed: () {
                  //   // Ação quando o botão for pressionado
                  //   showSearch(
                  //     context: context,
                  //     delegate: MySearchDelegate(), //CustomSearchDelegate(),
                  //   );
                  // },
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySearchDelegate()),
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all<double>(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 36,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'O que queres ouvir?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 40,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Albums" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
                      child: const Text('Músicas'),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Playlists" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
                      child: const Text('Playlists'),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Ação quando o botão "Playlists" é pressionado
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
                      child: const Text('Playlists'),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        //horizontal: 10.0).copyWith(right: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Align(
                      alignment: Alignment.centerLeft, // Alinhar à esquerda
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
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
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: albums.length,
                      itemBuilder: (BuildContext context, int index) {
                        final album = albums[index];
                        return GestureDetector(
                          onTap: () {
                            // Navegar para a página do reprodutor de música
                            // print( 'Tocando ${album.name}, do ${album.imageUrl}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    // MusicDetailPage(), // AudioPlayerSreen(),
                                    MusicDetailPage(
                                  musicID: album.id,
                                  title: album.name,
                                  description: "Wizkid",
                                  color: Colors.black,
                                  img: album.imageUrl,
                                  songUrl: "assets/audio/gym.mp3",
                                  // final String title;
                                  // final String description;
                                  // final Color color;
                                  // final String img;
                                  // final String songUrl;
                                  // ),
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(album.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: SizedBox(
                                  width: 120,
                                  child: Center(
                                    child: Text(
                                      album.name,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ],
          ),
        ),
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

// MySearchDelegate
class MySearchDelegate extends StatefulWidget {
  const MySearchDelegate({Key? key}) : super(key: key);

  @override
  State<MySearchDelegate> createState() => _MySearchDelegateState();
}

class _MySearchDelegateState extends State<MySearchDelegate> {
  // Result result = Result('nome', 'type', 'artists', 'coverImg', 'duration');
  // Result
  static List<Result> dummyResults = [
    Result('Ruben', 'Artist', 'Ruben', 'assets/images/background.jpg', '-'),
    Result('rui', 'Artist', 'rui', 'assets/images/background.jpg', '-'),
    Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
    Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
    Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
    Result('Nome Music 1', 'Music', 'WEb badga', 'assets/images/background.jpg',
        '2:10min'),
    Result('Nome Music 2', 'Music', 'Red', 'assets/images/background.jpg',
        '3:10min'),
    Result('Nome Music 3', 'Music', 'Green & Ruben',
        'assets/images/background.jpg', '4:10min'),
    Result('Nome Music 4', 'Music', 'Blue', 'assets/images/background.jpg',
        '5:10min'),
    Result('Ruben', 'Artist', 'Ruben', 'assets/images/background.jpg', '-'),
    Result('rui', 'Artist', 'rui', 'assets/images/background.jpg', '-'),
    Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
    // Result('Rita', 'Artist', 'Rita', 'assets/images/background.jpg', '-'),
  ];
  // https://www.youtube.com/watch?v=jFHSkfjN96I

  List<Result> display_results = [];

  void updateList(String value) {
    if (mounted) {
      setState(() {
        display_results = dummyResults
            .where((element) =>
                element.nome.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  void clearList() {
    if (mounted) {
      setState(() {
        display_results = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(1.0), // Set the height of the border
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(
                      255, 122, 122, 122), // Set the color of the border
                  width: 1.0, // Set the width of the border
                ),
              ),
            ),
          ),
        ),
        // toolbarHeight: 120,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () {
            // showSearch(context: context, delegate: CustomSearchDelegate());
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            // backgroundColor: Colors.red,
          ),
        ),
        title: TextField(
          onChanged: (value) => updateList(value),
          autofocus: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            // remove the underline

            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            // filled: true,
            // fillColor: Color.fromARGB(255, 187, 22, 22),
            // border: InputBorder.none,
            hintText: 'O que queres ouvir?',
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              // bold
              fontWeight: FontWeight.bold,
            ),
            // border: InputBorder.none,
            // prefixIcon: Icon(Icons.arrow_back, color: Colors.black),
            // prefixIconConstraints: BoxConstraints(
            //   minWidth: 50,
            //   minHeight: 50,
            // ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
            //   borderSide: BorderSide.none,
            //   // borderSide: BorderSide(
            //   //   color: Color.fromARGB(0, 16, 16, 16),
            //   //   width: 1,
            //   // ),
            // ),
            // suffixIcon: IconButton(
            //   onPressed: () {
            //     // showSearch(context: context, delegate: CustomSearchDelegate());
            //   },
            //   icon: const Icon(Icons.clear, color: Colors.black),
            // ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: CustomSearchDelegate());
              // clear the search
              clearList();
              // updateList('');
            },
            icon: const Icon(Icons.clear, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: display_results.length == 0
                ? const Center(
                    child: Text('No results Found',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          // backgroundColor: Colors.red,
                          // print('No results Found'),
                        )),
                  )
                : ListView.builder(
                    itemCount: display_results.length,
                    itemBuilder: (context, index) => ListTile(
                      // backgroundColor: Colors.black,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 0.0),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MusicPlayer(),
                        //   ),
                        // );
                      },
                      title: Text(display_results[index].nome,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                      subtitle: Text(
                          '${display_results[index].nome} : ${display_results[index].artist}',
                          style: const TextStyle(
                            color: Colors.black87,
                            // backgroundColor: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 12,
                          )),
                      // trailing: Text(display_results[index].duration,
                      // style: const TextStyle(
                      // color: Colors.black87,
                      // fontWeight: FontWeight.bold,
                      //  )),
                      leading: Image(
                        image: AssetImage(display_results[index].coverImg),
                        // image: AssetImage('assets/icons/google.png'),
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                        // color: Colors.black,
                        // colorBlendMode: BlendMode.darken,

                        // For asset images
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class MusicDetailPage extends StatefulWidget {
  final String musicID;
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;
  // final List<String> likesID;
  // final int nlikes;
  // detalhes da musica?? tempo, nome, artista, etc

  const MusicDetailPage({
    Key? key,
    required this.musicID,
    required this.title,
    required this.description,
    required this.color,
    required this.img,
    required this.songUrl,
    // required this.likesID,
  }) : super(key: key);

  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  bool isPressed = false;
  final AudioPlayer audioPlayer = AudioPlayer();

  Duration? duration;
  int minutes = 0;
  int seconds = 0;
  bool isPlaying = true;
  double _value = 0.0;

  @override
  void initState() {
    super.initState();
    // _audioPlayer = AudioPlayer()..setSourceAsset('assets/gym.mp3');
    // audioPlayer.setAsset('assets/audio/gym.mp3');
    // audioPlayer.play();
    // final duration = audioPlayer.duration;
    // if (duration != null) {
    //   final durationInSeconds = duration!.inSeconds;
    //   final minutes = durationInSeconds ~/ 60;
    //   final seconds = durationInSeconds % 60;
    //   print('Duração: $minutes minutos e $seconds segundos');
    // } else {
    //   print('A duração da música é desconhecida.');
    // }
    initializeAudio();

    // se o user tiver na lista, liske para comecar senao like vazio
    // getNumLikes()
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  int getNumLikes() {
    // return widget.likesID.length;
    return 0;
  }

  Future<void> initializeAudio() async {
    await audioPlayer.setAsset(widget.songUrl);

    audioPlayer.durationStream.listen((d) {
      if (mounted) {
        setState(() {
          duration = d;
          final durationInSeconds = duration!.inSeconds;
          minutes = durationInSeconds ~/ 60;
          seconds = durationInSeconds % 60;
        });
      }
    });

    audioPlayer.positionStream.listen((p) {
      if (mounted) {
        setState(() {
          _value = p.inSeconds.toDouble();
        });
      }
    });
    await audioPlayer.play();
  }

  String formatDurationT(int minutes, int seconds) {
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = seconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');

      String minutes = twoDigits(duration.inMinutes.remainder(60));
      String seconds = twoDigits(duration.inSeconds.remainder(60));

      if (duration.inHours > 0) {
        return '${twoDigits(duration.inHours)}:$minutes:$seconds';
      } else {
        return '$minutes:$seconds';
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.expand_more,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Container(
                    width: size.width - 100,
                    height: size.width - 100,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          // color: Colors.black.withOpacity(0.2),
                          color: widget.color,
                          blurRadius: 100,
                          spreadRadius: 10,
                          offset: const Offset(20, 20))
                    ], borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
                  child: Container(
                    width: size.width - 5,
                    height: size.width - 0,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(
                            // 'assets/images/background.jpg'
                            widget.img), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              // color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.blueGrey,
                  child: SizedBox(
                    width: size.width - 20,
                    // height: 55,
                    // color: Colors.blueGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // nome do artista e da msuica
                        Padding(
                          // padding: const EdgeInsets.only( left: 10, right: 10, top: 10, bottom: 0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  // "StarBoy",
                                  widget.title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  // "Wizkid",
                                  widget.description,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Like

                        Material(
                          color: Colors.transparent,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: TextButton(
                                onPressed: () {
                                  if (mounted) {
                                    setState(() {
                                      isPressed = !isPressed;
                                      // saveLikeState(isPressed);
                                    });
                                  }
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(EdgeInsets.zero),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          CircleBorder()),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(35, 35)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                  elevation: MaterialStateProperty.all<double>(
                                      0), // Set elevation to 0
                                ),
                                child: Icon(
                                  isPressed
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isPressed ? Colors.red : Colors.black,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            StatefulBuilder(builder: (context, state) {
              return Column(
                children: [
                  Container(
                    // color: Colors.grey
                    //     .withOpacity(0.2), // Define a cor de fundo desejada
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 2),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight:
                            2, // Defina a espessura desejada para o slider
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 5, // Tamanho do círculo
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 1, // Tamanho da sobreposição
                        ),
                        activeTrackColor: Colors.blue, // Cor da barra ativa
                        inactiveTrackColor: Colors.grey, // Cor da barra inativa
                        thumbColor:
                            Colors.red, // Cor do círculo do controle deslizante
                        overlayColor: Colors.green.withOpacity(
                            0.4), // Cor da sobreposição ao arrastar o controle deslizante
                        activeTickMarkColor:
                            Colors.black, // Cor das marcas de escala ativas
                        inactiveTickMarkColor:
                            Colors.grey, // Cor das marcas de escala inativas
                        valueIndicatorColor:
                            Colors.yellow, // Cor do indicador de valor
                        showValueIndicator: ShowValueIndicator
                            .always, // Exibir indicador de valor
                        valueIndicatorShape:
                            const PaddleSliderValueIndicatorShape(), // Forma do indicador de valor
                        valueIndicatorTextStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ), // Estilo do texto do indicador de valor
                      ),
                      child: Slider(
                        // activeColor: Colors.black,
                        value: _value.toDouble(),
                        min: 0,
                        max: duration != null
                            ? duration!.inSeconds.toDouble()
                            : 0,
                        onChanged: (double value) {
                          if (mounted) {
                            setState(() {
                              _value = value;
                              audioPlayer
                                  .seek(Duration(seconds: _value.toInt()));
                            });
                          }
                        },
                        label:
                            formatDuration(Duration(seconds: _value.toInt())),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatDuration(Duration(seconds: _value.toInt())),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          formatDurationT(minutes, seconds),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.teal, // Substitua pela cor desejada
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Lógica para lidar com o botão de embaralhar
                          },
                          icon: const Icon(size: 30, Icons.shuffle),
                        ),
                        IconButton(
                          onPressed: () {
                            // Lógica para lidar com o botão de voltar
                          },
                          icon: const Icon(size: 30, Icons.skip_previous),
                        ),
                        IconButton(
                          iconSize: 70,
                          icon: Container(
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                size: 50,
                                // Icons.pause,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            isPlaying
                                ? audioPlayer.pause()
                                : audioPlayer.play();
                            if (mounted) {
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            }
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            // Lógica para lidar com o botão de avançar
                          },
                          icon: const Icon(size: 30, Icons.skip_next),
                        ),
                        IconButton(
                          onPressed: () {
                            // Lógica para lidar com o botão de retweet
                          },
                          icon: const Icon(size: 30, Icons.repeat),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                //arro down
                Icons.arrow_downward,
                color: Colors.black,
                size: 30,
              ),
              Text(
                "Swipe down to minimize",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<String> results = [];
  bool isList = true;

  // List<Album> libraryData = [
  //   Album(
  //     name: "StarBoy 1",
  //     imageUrl: "assets/images/3.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 2",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 3",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 4",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 5",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 1",
  //     imageUrl: "assets/images/3.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 2",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 3",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 4",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 5",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 1",
  //     imageUrl: "assets/images/3.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 2",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 3",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 4",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   Album(
  //     name: "StarBoy 5",
  //     imageUrl: "assets/images/background.jpg",
  //   ),
  //   // Adicione mais álbuns conforme necessário
  // ];

  List<Map<String, dynamic>> musicas = [];
  AuthService authService = AuthService();

  Future<void> fetchMusicasUser() async {
    List<Map<String, dynamic>> fetchedMusicas =
        await authService.getMusicasUser();

    List<Map<String, dynamic>> fetchedPlaylists =
        await authService.getPlaylistsUser();

    List<Map<String, dynamic>> mergedList = [
      ...fetchedMusicas,
      ...fetchedPlaylists
    ];

    // adicionar filtros e ordem
    // mergedList.sort((a, b) => a['name'].compareTo(b['name']));

    // Faça o processamento dos dados das músicas recebidas (por exemplo, salvar em uma variável do estado para uso na interface)
    if (mounted) {
      setState(() {
        musicas = mergedList;
      });
    }
  }

  @override
  void dispose() {
    // Realize qualquer limpeza necessária aqui, como cancelar timers ou liberar recursos

    super.dispose(); // Chamar o super.dispose()
  }

  @override
  void initState() {
    super.initState();
    fetchMusicasUser(); // Chame a função para buscar as músicas do usuário assim que a página for iniciada
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // Remover sombra da AppBar
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remover botão de retorno
        title: Row(
          children: [
            Image.asset(
              'assets/images/playstore.png', // logo, nao mexer
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 8),
            const Text(
              'Library',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              // Lógica para o botão de pesquisa -. MySearchLibrary
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MySearchLibrary(),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () {
                                // Ação quando o botão "Albums" é pressionado
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: Colors.black),
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                                  const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: Colors.black),
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
                                  const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: Colors.black),
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
                                  const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              child: const Text('Playlists'),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                SizedBox(width: 5),
                                Icon(Icons.sort, color: Colors.black),
                                SizedBox(width: 12),
                                Text(
                                  "Recent Added",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (mounted) {
                                    setState(() {
                                      isList = !isList;
                                    });
                                  }
                                },
                                child: Icon(
                                  isList ? Icons.list : Icons.grid_view_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 14),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible:
                            isList, // Define a visibilidade com base no valor de isList
                        child: SingleChildScrollView(
                          child: Container(
                            // color: Colors.blue,
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: GridView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(
                                  left: 14, right: 10, top: 10, bottom: 10),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Número de colunas desejado
                                crossAxisSpacing:
                                    5, // Espaçamento entre as colunas
                                mainAxisSpacing:
                                    5, // Espaçamento entre as linhas
                                mainAxisExtent: 140, // Altura das linhas
                              ),
                              itemCount: musicas.length,
                              itemBuilder: (BuildContext context, int index) {
                                final data = musicas[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MusicDetailPage(
                                          musicID: data['id'],
                                          title: data['title'],
                                          description: data['description'],
                                          color: Colors.black,
                                          img: data['imageUrl'],
                                          songUrl: "assets/audio/gym.mp3",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    // color: Colors.yellow,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: ClipRRect(
                                            borderRadius:
                                                data['type'] == 'playlist'
                                                    ? BorderRadius.circular(60)
                                                    : BorderRadius.circular(8),
                                            child: Image.asset(
                                              data['imageUrl'],
                                              fit: BoxFit.cover,
                                              height: 100,
                                              width: 100,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 2.0,
                                              bottom: 0.0,
                                              right: 1.0),
                                          child: Text(
                                            data['title'],
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              // letterSpacing: -0.4,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 1.0,
                                              bottom: 0.0,
                                              right: 1.0),
                                          child: Text(
                                            data['description'] ?? '',
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              // letterSpacing: -0.4,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            softWrap: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            !isList, // Define a visibilidade com base no valor inverso de isList
                        child: SingleChildScrollView(
                          child: Container(
                            // color: Colors.amber,
                            // width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.65,
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 0, bottom: 0),
                            child: ListView.builder(
                              itemCount: musicas.length,
                              itemBuilder: (BuildContext context, int index) {
                                final data = musicas[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 6.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MusicDetailPage(
                                            musicID: data['id'],
                                            title: data['title'],
                                            description: data['description'],
                                            color: Colors.black,
                                            img: data['imageUrl'],
                                            songUrl: "assets/audio/gym.mp3",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      // color: Colors.red,
                                      margin: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      // padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                        // border: Border.all(
                                        //   color: Colors.black,
                                        //   width: 0.1,
                                        // ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                data['type'] == 'playlist'
                                                    ? BorderRadius.circular(60)
                                                    : BorderRadius.circular(8),
                                            child: Image.asset(
                                              data['imageUrl'],
                                              fit: BoxFit.cover,
                                              height: 70,
                                              width: 70,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['title'],
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  data['description'] ?? '',
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5, // Vertical position
            right: 10, // Horizontal position
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPlaylistPage(),
                  ),
                );
              },
              child: Container(
                width: 145,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'New Playlist',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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

// MySearchDelegate
// class MySearchLibrary extends StatefulWidget {
//   const MySearchLibrary({Key? key}) : super(key: key);

//   @override
//   State<MySearchLibrary> createState() => _MySearchLibraryState();
// }

// class _MySearchLibraryState extends State<MySearchLibrary> {
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
//     if (mounted) {
//       setState(() {
//         display_results = dummyResults
//             .where((element) =>
//                 element.nome.toLowerCase().contains(value.toLowerCase()))
//             .toList();
//       });
//     }
//   }

//   void clearList() {
//     if (mounted) {
//       setState(() {
//         display_results = [];
//       });
//     }
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
// automaticallyImplyLeading: false,
// backgroundColor: Colors.transparent,
// elevation: 0,
// titleSpacing: 0.0,
// leading: IconButton(
//   onPressed: () {
//     // showSearch(context: context, delegate: CustomSearchDelegate());
//     Navigator.pop(context);
//   },
//   icon: const Icon(
//     Icons.arrow_back,
//     color: Colors.black,
//     // backgroundColor: Colors.red,
//   ),
// ),
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

// / / / / / / / / / / / / / / / / / / / /

class MySearchLibrary extends StatefulWidget {
  const MySearchLibrary({Key? key}) : super(key: key);
  @override
  _MySearchLibraryState createState() => _MySearchLibraryState();
}

// class _MySearchLibraryState extends State<MySearchLibrary> {
//   String _searchText = '';
//   List<String> _searchResults = [];

//   void _performSearch() {
//     // Aqui você pode implementar a lógica para enviar uma solicitação de pesquisa
//     // com o texto digitado na barra de pesquisa (_searchText).
//     // Por enquanto, vamos apenas simular uma lista de resultados.
//     setState(() {
//       _searchResults = [
//         // firebase
//         'Resultado 1',
//         'Resultado 2',
//         'Resultado 3',
//       ];
//     });
//   }

//   void _applyFilter(String filter) {
//     setState(() {
//       // Aqui você pode implementar a lógica para aplicar o filtro selecionado aos resultados da pesquisa.
//       // Por enquanto, vamos apenas filtrar os resultados simulados com base no filtro selecionado.
//       _searchResults =
//           _searchResults.where((result) => result.contains(filter)).toList();
//     });
//   }

//   void _updateSearchResults(String searchText) {
//     setState(() {
//       if (searchText.isEmpty) {
//         // Se a barra de pesquisa estiver vazia, exiba todos os resultados
//         _searchResults = [
//           'Resultado 1',
//           'Resultado 2',
//           'Resultado 3',
//         ];
//       } else {
//         // Caso contrário, filtre os resultados com base no texto da pesquisa
//         _searchResults = _searchResults
//             .where((result) => result.contains(searchText))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
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
//           onChanged: (value) {
//             if (mounted) {
//               setState(() {
//                 _searchText = value;
//                 _updateSearchResults(_searchText);
//               });
//             }
//           },
//           onSubmitted: (value) {
//             _performSearch();
//           },
//           autofocus: true,
//           decoration: InputDecoration(
//             hintText: 'Search on your library...',
//             suffixIcon: IconButton(
//               onPressed: () {
//                 setState(() {
//                   _searchText = '';
//                   _updateSearchResults(_searchText);
//                 });
//               },
//               icon: const Icon(
//                 Icons.clear,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//         // actions: [
//         //   IconButton(
//         //     onPressed: () {
//         //       // clear the search
//         //       setState(() {
//         //         _searchText = '';
//         //         _updateSearchResults(_searchText);
//         //       });
//         //     },
//         //     icon: const Icon(
//         //       Icons.clear,
//         //       color: Colors.black,
//         //     ),
//         //   ),
//         // ],
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Aplicar filtro de músicas
//                   _applyFilter('Musics');
//                 },
//                 child: Text('Musics'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Aplicar filtro de playlists
//                   _applyFilter('Playlists');
//                 },
//                 child: Text('Playlists'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Aplicar filtro de artistas
//                   _applyFilter('Artists');
//                 },
//                 child: Text('Artists'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Aplicar filtro de álbuns
//                   _applyFilter('Albums');
//                 },
//                 child: Text('Albums'),
//               ),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _searchResults.length,
//               itemBuilder: (context, index) {
//                 final result = _searchResults[index];
//                 return ListTile(
//                   title: Text(result),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

class _MySearchLibraryState extends State<MySearchLibrary> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _searchResults = [];
  bool _isSearching = false;
  // varivel de filto
  // String _filter = '';

  void _performSearch(String searchText) {
    setState(() {
      _isSearching = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      AuthService().searchtermLibrary(searchText).then((results) {
        setState(() {
          _searchResults = results;
          _isSearching = false;
        });
      });

      // setState(() {
      //   // _searchResults = allResults;
      //   _searchResults = [
      //     'Resultado 1',
      //     'Resultado 2',
      //     'Resultado 3',
      //   ];
      //   _isSearching = false;
      // });
    });
  }

  // void _applyFilter(String filter) {
  //   setState(() {
  //     _searchResults = _searchResults
  //         .where(
  //             (result) => result.toLowerCase().contains(filter.toLowerCase()))
  //         .toList();
  //   });
  // }

  void _updateSearchResults(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    if (_searchDebouncer != null && _searchDebouncer!.isActive) {
      _searchDebouncer!.cancel();
    }

    _searchDebouncer = Timer(Duration(milliseconds: 300), () {
      _performSearch(searchText); // searchText
    });
  }

  // Widget getImage(String imageUrl) {
  //   if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
  //     return Image.network(imageUrl);
  //   } else {
  //     try {
  //       return Image.asset(imageUrl);
  //     } catch (e) {
  //       print('Error loading image: $e');
  //       return Container(
  //         width: 50,
  //         height: 50,
  //         color: Colors.grey,
  //         child: const Icon(
  //           Icons.image_not_supported,
  //           color: Colors.white,
  //         ),
  //       );
  //     }
  //   }
  // }

  Widget getImage(String imageUrl) {
    // print("Image URL: " + imageUrl);
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      print("Image URL: ruben");
      try {
        print(imageUrl.startsWith('http://'));
        return Container(
          width: 70, // Defina a largura desejada
          height: 130, // Defina a altura desejada
          child: Image.network(
            imageUrl,
            fit: BoxFit
                .cover, // Ajuste o modo de ajuste da imagem (cover, contain, etc.)
          ),
        );
      } catch (e) {
        print('Error loading image: $e');
        return Container(
          width: 50,
          height: 50,
          color: Colors.grey,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.white,
          ),
        );
      }
    } else {
      try {
        return Container(
          width: 70, // Defina a largura desejada
          height: 130, // Defina a altura desejada
          child: Image.asset(
            imageUrl,
            fit: BoxFit
                .cover, // Ajuste o modo de ajuste da imagem (cover, contain, etc.)
          ),
        );
      } catch (e) {
        print('Error loading image: $e');
        return Container(
          width: 50,
          height: 50,
          color: Colors.grey,
          child: const Icon(
            Icons.image_not_supported,
            color: Colors.white,
          ),
        );
      }
    }
  }

  Timer? _searchDebouncer;

  @override
  void dispose() {
    _searchController.dispose();
    _searchDebouncer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(1.0), // Set the height of the border
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(
                      255, 122, 122, 122), // Set the color of the border
                  width: 1.0, // Set the width of the border
                ),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            _updateSearchResults(value);
          },
          onSubmitted: (value) {
            _performSearch(value);
          },
          autofocus: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            // remove the underline

            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            // filled: true,
            // fillColor: Colors.grey[600], // Cor de fundo
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Search on your library...',
            contentPadding: EdgeInsets.symmetric(vertical: 14.0),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _updateSearchResults('');
                });
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isSearching
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : _searchResults.isEmpty
                    ? _searchController.text.isEmpty
                        ? const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Encontra os teus preferidos",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Procura tudo: artistas, musicas e playlists",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  constraints: const BoxConstraints(
                                    maxWidth:
                                        270, // Defina o tamanho máximo de largura desejado
                                  ),
                                  child: Text(
                                    "Could not find any results of '${_searchController.text.isNotEmpty ? _searchController.text + "'" : "' your search"}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  // color: Colors.blue,
                                  constraints: const BoxConstraints(
                                    maxWidth:
                                        270, // Defina o tamanho máximo de largura desejado
                                  ),
                                  child: const Text(
                                    // central text

                                    "Try searching again with a different \nterm or keyword",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                    : ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final result = _searchResults[index];
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 16.0),
                            leading: getImage(result['image'] ?? ''),
                            //Image.network(result['image'] ?? ''),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result['title'] ?? 'title default',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  result['type'] ?? 'type default',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

// / / / / / / / / / / / / / / / / / / / /

class NewPlaylistPage extends StatefulWidget {
  const NewPlaylistPage({Key? key}) : super(key: key);

  @override
  _NewPlaylistPageState createState() => _NewPlaylistPageState();
}

class _NewPlaylistPageState extends State<NewPlaylistPage> {
  final TextEditingController playlistController = TextEditingController();

  void dispose() {
    playlistController.dispose();
    super.dispose();
  }

  void showAlert() {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Playlist created'),
    //       content: Text('Your playlist was created successfully'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.pop(context);
    //             Navigator.pop(context);
    //           },
    //           child: const Text('Cancelar'),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             // Lógica a ser executada quando o botão "OK" for pressionado
    //             Navigator.pop(context);
    //             Navigator.pop(context);
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 221, 221, 221).withOpacity(0.9),
          title: const Text(
            'Are you sure?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          content: const Icon(
            Icons.help_outline,
            color: Colors.yellow,
            size: 80,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Lógica a ser executada quando o botão "OK" for pressionado
                final playlistName = playlistController.text;
                AuthService()
                    .createPlaylist(playlistName, "Other", "playlistImage");

                Navigator.pop(context);
                Navigator.pop(context);
              },
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              // ),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // butao no centro e uma lista por debaixo
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Lógica para fazer upload de uma imagem
                        // Implemente aqui a funcionalidade de upload da imagem
                        print("Upload");
                      },
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            // backgroundColor: Colors.grey,
                            backgroundImage:
                                AssetImage('assets/images/funny.jpg'),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(
                                  0.5), // Adiciona uma camada de opacidade preta
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // const SizedBox(height: 5),
                    const Text(
                      'Give your playlist a name',
                      style: TextStyle(
                        fontSize: 20,
                        // color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      // color: Colors.amber,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      // padding: EdgeInsets.symmetric(vertical: -5.0),
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        controller: playlistController,
                        decoration: const InputDecoration(
                          hintText: 'Playlist name',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.only(left: 10.0),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para cancelar (back)
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // Remove a sombra
                              minimumSize: const Size(
                                  120, 50), // Aumenta o tamanho do botão
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              side: BorderSide(color: Colors.black, width: 0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    40.0), // Define o raio de arredondamento
                              ),
                            ),
                            child: Text('Cancelar'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para Criar (aaddicionar playlist)

                              showAlert();

                              // Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // Remove a sombra
                              minimumSize:
                                  Size(100, 50), // Aumenta o tamanho do botão
                              backgroundColor: Colors.blue[900],
                              foregroundColor: Colors.white,
                              // side: BorderSide(color: Colors.black, width: 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    40.0), // Define o raio de arredondamento
                              ),
                            ),
                            child: Text('Criar'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// / / / / / / / / / / / / / / / / / / / / / / / /

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

// class _ProfilePageState extends State<ProfilePage> {
//   String? getFirstName() {
//     String? fullName = AuthService().getUserName();
//   }
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
//   bool isList = true;
//   final List<Map<String, String>> data = [
//     {
//       'image': 'https://picsum.photos/100',
//       'title': 'Título 1',
//       'subtitle': 'Subtítulo 1'
//     },
//     {
//       'image': 'https://picsum.photos/100',
//       'title': 'Título 2',
//       'subtitle': 'Subtítulo 2'
//     },
//     {
//       'image': 'https://picsum.photos/100',
//       'title': 'Título 3',
//       'subtitle': 'Subtítulo 3'
//     },
//     {
//       'image': 'https://picsum.photos/100',
//       'title': 'Título 4',
//       'subtitle': 'Subtítulo 4'
//     },
//   ];
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
//               color: Colors.white.withOpacity(0.7),
//               // padding:
//               //     const EdgeInsets.only(left: 5, top: 0, bottom: 0, right: 5),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 // color: Colors.amber,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         // color: Colors.amber.withOpacity(0.9),
//                         width: 70,
//                         padding: const EdgeInsets.only(
//                             left: 0, top: 5, bottom: 0, right: 0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             CircleAvatar(
//                               // profile image from google acount
//                               // backgroundImage: AssetImage(
//                               //   getProfileImage(),
//                               // ),
//                               // backgroundImage:
//                               //     Image.network(
//                               //       // Provider.of(context).auth.getProfileImage()),
//                               //       AuthService().getProfileImage()),
//                               backgroundImage: NetworkImage(
//                                   AuthService().getProfileImage() ?? ''),
//                               radius: 30,
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               AuthService().getUserName() ?? '',
//                               // getFirstName(),
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 // fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         // color: Colors.blue.withOpacity(0.9),
//                         // width: 90,
//                         padding: const EdgeInsets.only(
//                             left: 10, top: 5, bottom: 0, right: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text(
//                                       '2.9M',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         // fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 1),
//                                     Text(
//                                       'followers',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         // fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Column(
//                                   children: [
//                                     Text(
//                                       '5.9',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 1),
//                                     Text(
//                                       'rating',
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         // fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 30),
//                                 Column(
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // Adicione aqui a lógica para abrir a tela de edição de perfil
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         primary: Colors
//                                             .transparent, // Não é mais necessário, utilize o backgroundColor
//                                         onPrimary: Colors
//                                             .black, // Define a cor do texto
//                                         side: const BorderSide(
//                                             color: Colors.black,
//                                             width:
//                                                 1.0), // Adiciona uma borda preta
//                                         elevation: 0, // Remove a sombra
//                                       ),
//                                       child: const Text(
//                                         'Editar Perfil',
//                                         style: TextStyle(
//                                           fontSize:
//                                               13, // Diminui o tamanho do texto
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 1),
//                             const Row(
//                               // descricao
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Lorem ipsum dolor sit ametdsdadasd sss.',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     // fontWeight: FontWeight.bold,
//                                   ),
//                                   softWrap: true,
//                                   maxLines:
//                                       2, // Define o número máximo de linhas
//                                   overflow: TextOverflow
//                                       .ellipsis, // Adiciona "..." quando o texto é muito longo
//                                   textAlign: TextAlign
//                                       .center, // Centraliza o texto horizontalmente
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   // const SizedBox(height: 5),
//                   // Visibility(
//                   //   visible:
//                   //       true, // Define a visibilidade com base no valor de isList
//                   //   child: SingleChildScrollView(
//                   //     child: Container(
//                   //       color: Colors.blue,
//                   //       // height: MediaQuery.of(context).size.height * 0.4,
//                   //       child: GridView.builder(
//                   //         shrinkWrap: true,
//                   //         padding: const EdgeInsets.only(
//                   //             left: 14, right: 10, top: 10, bottom: 10),
//                   //         gridDelegate:
//                   //             const SliverGridDelegateWithFixedCrossAxisCount(
//                   //           crossAxisCount: 3, // Número de colunas desejado
//                   //           crossAxisSpacing: 5, // Espaçamento entre as colunas
//                   //           mainAxisSpacing: 5, // Espaçamento entre as linhas
//                   //           mainAxisExtent: 150, // Altura das linhas
//                   //         ),
//                   //         itemCount: libraryData.length,
//                   //         itemBuilder: (BuildContext context, int index) {
//                   //           final data = libraryData[index];
//                   //           return GestureDetector(
//                   //             onTap: () {
//                   //               Navigator.push(
//                   //                 context,
//                   //                 MaterialPageRoute(
//                   //                   builder: (context) => MusicDetailPage(
//                   //                     title: data.name,
//                   //                     description: "Wizkid",
//                   //                     color: Colors.black,
//                   //                     img: data.imageUrl,
//                   //                     songUrl: "assets/audio/gym.mp3",
//                   //                   ),
//                   //                 ),
//                   //               );
//                   //             },
//                   //             child: Container(
//                   //               child: Column(
//                   //                 children: [
//                   //                   ClipRect(
//                   //                     child: ClipRRect(
//                   //                       borderRadius: BorderRadius.circular(8),
//                   //                       child: Image.asset(
//                   //                         data.imageUrl,
//                   //                         fit: BoxFit.cover,
//                   //                         height: 100,
//                   //                         width: 100,
//                   //                       ),
//                   //                     ),
//                   //                   ),
//                   //                   const Padding(
//                   //                     padding: EdgeInsets.only(
//                   //                         left: 0.0,
//                   //                         top: 2.0,
//                   //                         bottom: 1.0,
//                   //                         right: 1.0),
//                   //                     child: Text(
//                   //                       'Título da Legenda',
//                   //                       style: TextStyle(
//                   //                         fontSize: 13,
//                   //                         fontWeight: FontWeight.bold,
//                   //                         // letterSpacing: -0.4,
//                   //                       ),
//                   //                       overflow: TextOverflow.ellipsis,
//                   //                       maxLines: 1,
//                   //                       softWrap: false,
//                   //                     ),
//                   //                   ),
//                   //                   const Padding(
//                   //                     padding: EdgeInsets.only(
//                   //                         left: 0.0,
//                   //                         top: 2.0,
//                   //                         bottom: 1.0,
//                   //                         right: 1.0),
//                   //                     child: Text(
//                   //                       'Subtítulo da Legenda',
//                   //                       style: TextStyle(
//                   //                         fontSize: 11,
//                   //                         fontWeight: FontWeight.bold,
//                   //                         color: Colors.grey,
//                   //                         // letterSpacing: -0.4,
//                   //                       ),
//                   //                       overflow: TextOverflow.ellipsis,
//                   //                       maxLines: 2,
//                   //                       softWrap: false,
//                   //                     ),
//                   //                   ),
//                   //                 ],
//                   //               ),
//                   //             ),
//                   //           );
//                   //         },
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   // const SizedBox(height: 5),
//                   Visibility(
//                     visible: true,
//                     child: Expanded(
//                       child: Container(
//                         // color: Colors.blue,
//                         child: ListView(
//                           padding: const EdgeInsets.only(
//                             left: 5,
//                             right: 5,
//                             top: 0,
//                             bottom: 0,
//                           ),
//                           children: [
//                             SingleChildScrollView(
//                               child: GridView.builder(
//                                 shrinkWrap: true,
//                                 gridDelegate:
//                                     const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3,
//                                   crossAxisSpacing: 5,
//                                   mainAxisSpacing: 5,
//                                   mainAxisExtent: 150,
//                                 ),
//                                 itemCount: libraryData.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   final data = libraryData[index];
//                                   return GestureDetector(
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
//                                       child: Column(
//                                         children: [
//                                           ClipRect(
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               child: Image.asset(
//                                                 data.imageUrl,
//                                                 fit: BoxFit.cover,
//                                                 height: 100,
//                                                 width: 100,
//                                               ),
//                                             ),
//                                           ),
//                                           const Padding(
//                                             padding: EdgeInsets.only(
//                                               left: 0.0,
//                                               top: 2.0,
//                                               bottom: 1.0,
//                                               right: 1.0,
//                                             ),
//                                             child: Text(
//                                               'Título da Legenda',
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 1,
//                                               softWrap: false,
//                                             ),
//                                           ),
//                                           const Padding(
//                                             padding: EdgeInsets.only(
//                                               left: 0.0,
//                                               top: 2.0,
//                                               bottom: 1.0,
//                                               right: 1.0,
//                                             ),
//                                             child: Text(
//                                               'Subtítulo da Legenda',
//                                               style: TextStyle(
//                                                 fontSize: 11,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.grey,
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 2,
//                                               softWrap: false,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Container(),
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

class _ProfilePageState extends State<ProfilePage> {
  // int counter = 0;
  List<Map<String, dynamic>> myPlaylist = [];
  Map<String, dynamic> userProfile = {};
  bool isEditing = false;
  TextEditingController bioController = TextEditingController();
  String bio = '';
  FocusNode bioFocusNode = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   getmyplaylist();
  //   // AuthService().getUserProfile();
  //   getProfileInfo();
  // }
  void initState() {
    super.initState();
    myPlaylist = [];
    userProfile = {};
    getmyplaylist();
    getProfileInfo();

    bioController.text = bio;
    // setCursorAtEnd();
  }

  @override
  void dispose() {
    super.dispose();
    bioController.dispose();
    // Realize qualquer limpeza necessária aqui, como cancelar timers ou liberar recursos
  }

  void getmyplaylist() {
    // Adicionar informacoes as musicas
    if (mounted) {
      // AuthService().uploadMusic(
      //   " title 1",
      //   "assets/images/cover.jpg",
      //   "ruben descrition",
      //   5,
      // );
      // AuthService().getPlaylist().then((value) {  //HERE
      //   print(value);
      // });
      AuthService().getPlaylist().then((value) {
        setState(() {
          myPlaylist = value;
        });
      });
    }
  }

  void setCursorAtEnd() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (bioController.text.isNotEmpty) {
        bioController.selection = TextSelection.fromPosition(
          TextPosition(offset: bioController.text.length),
        );
      }
    });
  }

  void getProfileInfo() {
    if (mounted) {
      AuthService().getUserProfile().then((value) {
        setState(() {
          userProfile = value;
          // Atualizar o valor do TextField
        });
      });
    }
  }

  String getButtonText() {
    return isEditing ? '    Guardar   ' : 'Editar Perfil';
  }

  // void saveChanges() {
  //   String newBio = bioController.text;

  //   // Implemente a lógica para salvar as alterações no perfil

  //   setState(() {
  //     isEditing = false;
  //     bio = newBio;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Minha Página'),
  //     ),
  //     body: ListView.builder(
  //       itemCount: myPlaylist.length,
  //       itemBuilder: (context, index) {
  //         Map<String, dynamic> playlistData = myPlaylist[index];
  //         return ListTile(
  //           title: Text(playlistData['title']),
  //           subtitle: Text(playlistData['type'] ?? 'Type not available'),
  //           // Exiba outras informações necessárias
  //         );
  //       },
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    final marginHeight = MediaQuery.of(context).size.height * 0.3;
    String bio = userProfile['bio'] ?? '';
    int followers = userProfile['followers'] ?? 0;
    double rating = userProfile['rating'] ?? 0.0;

    // bio = userProfile['bio'] ?? '';
    bioController.text = bio;

    bioController.selection = TextSelection.fromPosition(
        TextPosition(offset: bioController.text.length));

    // bioFocusNode.addListener(() {
    //   if (bioFocusNode.hasFocus) {
    //     // Defina a posição do cursor no final do texto
    //     bioController.selection = TextSelection.fromPosition(
    //       TextPosition(offset: bioController.text.length),
    //     );
    //   }
    // });

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: marginHeight),
              child: Container(
                // margin: EdgeInsets.only(top: marginHeight),
                color: Colors.white.withOpacity(0.7),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.amber.withOpacity(0.9),
                          width: 70,
                          padding: const EdgeInsets.only(
                              left: 0, top: 5, bottom: 0, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                // profile image from google acount
                                // backgroundImage: AssetImage(
                                //   getProfileImage(),
                                // ),
                                // backgroundImage:
                                //     Image.network(
                                //       // Provider.of(context).auth.getProfileImage()),
                                //       AuthService().getProfileImage()),
                                backgroundImage: NetworkImage(
                                    AuthService().getProfileImage() ?? ''),
                                radius: 30,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                AuthService().getUserName() ?? '',
                                // getFirstName(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue.withOpacity(0.9),
                          // width: 90,
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 0, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        followers.toString(),
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // const SizedBox(height: 1),
                                      const Text(
                                        'followers',
                                        style: TextStyle(
                                          fontSize: 12,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    children: [
                                      Text(
                                        rating.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // const SizedBox(height: 1),
                                      const Text(
                                        'rating',
                                        style: TextStyle(
                                          fontSize: 12,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        // onPressed:
                                        // isEditing ? saveChanges : () {},
                                        onPressed: () {
                                          // setState(() {
                                          // isEditing = !isEditing;
                                          // if (isEditing) {
                                          //   FocusScope.of(context)
                                          //       .requestFocus(bioFocusNode);
                                          // }
                                          if (isEditing) {
                                            String newBio = bioController.text;
                                            AuthService().updateBio(newBio);

                                            if (mounted) {
                                              setState(() {
                                                bio = newBio;
                                                isEditing = false;
                                              });
                                            }
                                          } else {
                                            if (mounted) {
                                              setState(() {
                                                isEditing = true;
                                              });
                                            }

                                            FocusScope.of(context)
                                                .requestFocus(bioFocusNode);
                                          }
                                          // }
                                          // );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors
                                              .transparent, // Não é mais necessário, utilize o backgroundColor
                                          onPrimary: Colors
                                              .black, // Define a cor do texto
                                          side: const BorderSide(
                                              color: Colors.black,
                                              width:
                                                  1.0), // Adiciona uma borda preta
                                          elevation: 0, // Remove a sombra
                                        ),
                                        child: Text(
                                          getButtonText(),
                                          style: const TextStyle(
                                            fontSize:
                                                13, // Diminui o tamanho do texto
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 3),
                              Row(
                                // descricao
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  isEditing
                                      ? Container(
                                          // color: Colors.amber.withOpacity(0.9),
                                          width: 210,
                                          height: 25,
                                          // padding:
                                          //     EdgeInsets.symmetric(vertical: 1),
                                          child: TextField(
                                            // bio,
                                            controller: bioController,
                                            focusNode: bioFocusNode,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),

                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Text(
                                          bio,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                          softWrap: true,
                                          maxLines:
                                              2, // Define o número máximo de linhas
                                          overflow: TextOverflow
                                              .ellipsis, // Adiciona "..." quando o texto é muito longo
                                          textAlign: TextAlign
                                              .center, // Centraliza o texto horizontalmente
                                        ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: myPlaylist.isNotEmpty,
                      child: Expanded(
                        child: Container(
                          // color: Colors.blue,
                          child: ListView(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 0,
                              bottom: 0,
                            ),
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  mainAxisExtent: 150,
                                ),
                                itemCount: myPlaylist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final data = myPlaylist[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MusicDetailPage(
                                            musicID: data['id'],
                                            title: data['title'],
                                            description: data['description'],
                                            color: Colors.black,
                                            img: data['imageUrl'],
                                            songUrl: "assets/audio/gym.mp3",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          ClipRect(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                data['imageUrl'],
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 100,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 2.0,
                                              bottom: 1.0,
                                              right: 1.0,
                                            ),
                                            child: Text(
                                              data['title'],
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 0.0,
                                              top: 2.0,
                                              bottom: 1.0,
                                              right: 1.0,
                                            ),
                                            child: Text(
                                              data['description'],
                                              style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // ),
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
