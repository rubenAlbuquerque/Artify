import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package::file_picker/file_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _collection;

  FirestoreService(String collectionName)
      : _collection = FirebaseFirestore.instance.collection(collectionName);

  Future<void> criarDados(Map<String, dynamic> dados) async {
    try {
      await _collection.add(dados);
    } catch (e) {
      print('Erro ao criar dados: $e');
    }
  }

  Future<void> alterarDados(
      String documentId, Map<String, dynamic> dados) async {
    try {
      await _collection.doc(documentId).set(dados);
    } catch (e) {
      print('Erro ao alterar dados: $e');
    }
  }

  Future<void> apagarDados(String documentId) async {
    try {
      await _collection.doc(documentId).delete();
    } catch (e) {
      print('Erro ao apagar dados: $e');
    }
  }

  void setupFirestoreData() async {
    final userService = FirestoreService('users');
    final musicService = FirestoreService('music');
    final playlistService = FirestoreService('playlists');
    final albumService = FirestoreService('albums');
    final likeService = FirestoreService('likes');

    await userService.criarDados({
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'image': 'https://example.com/profile.jpg',
    });

    await musicService.criarDados({
      'title': 'Song 1',
      'artist': 'Artist 1',
      'duration': '3:45',
    });

    await playlistService.criarDados({
      'userId': 'user_id_1',
      'title': 'My Playlist',
      'description': 'My favorite songs',
      'songs': [
        musicService._collection.doc('music_id_1'),
        musicService._collection.doc('music_id_2'),
      ],
    });

    await albumService.criarDados({
      'userId': 'user_id_1',
      'title': 'My Album',
      'description': 'My awesome album',
      'songs': [
        musicService._collection.doc('music_id_3'),
        musicService._collection.doc('music_id_4'),
      ],
    });

    await likeService.criarDados({
      'userId': 'user_id_1',
      'playlist': playlistService._collection.doc('playlist_id_1'),
      'likesCount': 10,
    });
  }
}

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn? googlesignIn = GoogleSignIn();

  // Verificar se o usuário já fez login antes
  bool isUserSignedIn() {
    final GoogleSignInAccount? googleUser = googlesignIn!.currentUser;
    return googleUser != null; // se o googleUser for diferente de null, retora
  }

  // google sign in service
  Future<void> signInWithGoogle() async {
    // begin interaction with google sign in
    final GoogleSignInAccount? googleUser = await googlesignIn!.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(userCredential.user!.uid)
    //     .set({
    //   'email': userCredential.user!.email,
    //   'teste': "Lisbon",
    //   "seguidores": "0",
    //   "verify": true
    // });
    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(userCredential.user!.uid)
    //     .set({
    //   'name': userCredential.user!.displayName,
    //   'email': userCredential.user!.email,
    //   'image': "https://example.com/profile.jpg",
    //   'bio': "I love music!",
    //   'followers': [],
    //   'rating': 0,
    //   // 'following': [],
    //   'verify': true
    // });

    // verify if user is new or old
    // String userId = userCredential.user!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot =
        await users.where('verify', isEqualTo: true).get();

    if (querySnapshot.size == 0) {
      // se nao hover nenhum user com verify = true,
      //entao é um novo user

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': userCredential.user!.displayName,
        'email': userCredential.user!.email,
        'image': "https://example.com/profile.jpg",
        'bio': "I love music!",
        'followers': [],
        'rating': 0,
        // 'following': [],
        'verify': true
      });
    }
    ;
  }

  // obter nome do usuário
  String? getUserName() {
    if (auth.currentUser!.displayName == null) {
      return 'Utilizador';
    } else {
      if (auth.currentUser!.displayName!.length > 10) {
        List<String> nameParts = auth.currentUser!.displayName!.split(' ');
        return nameParts[0];
      }
      // return auth.currentUser!.displayName;
      return 'Utilizador NULL';
    }
  }

  //

  // obter email do usuário
  String? getUserEmail() {
    if (auth.currentUser!.email == null) {
      return 'Utilizador';
    } else {
      return auth.currentUser!.email;
    }
  }

  String? getProfileImage() {
    if (auth.currentUser!.photoURL == null) {
      return 'https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png';
    } else {
      return auth.currentUser!.photoURL;
    }
  }

  // popular a firebase com os dados da playlist
  void savePlaylistData() async {
    final playlistService = FirestoreService('playlists');
    final musicService = FirestoreService('music');

    // musicas da myplaylist
    final song1Ref = await musicService.criarDados({
      'title': 'Song 1',
      'userId': auth.currentUser!.uid,
      'imageUrl': 'assets/images/background.jpg',
      'description': 'Song 1',
      'likes': 20,
    });

    final song2Ref = await musicService.criarDados({
      'title': 'Song 2',
      'userId': auth.currentUser!.uid,
      'imageUrl': 'assets/images/background.jpg',
      'description': 'Song 2',
      'likes': 2,
    });

    final song3Ref = await musicService.criarDados({
      'title': 'Song 3',
      'userId': auth.currentUser!.uid,
      'imageUrl': 'assets/images/background.jpg',
      'description': 'Song 3',
      'likes': 2,
    });

    // playslist do user: MyPlaylist

    await playlistService.criarDados({
      'userId': auth.currentUser!.uid,
      'title': 'My Playlist',
      'description': 'My songs',
      'songs': [
        song1Ref,
        song2Ref,
        song3Ref,
      ],
    });
  }

  Future<void> signOut() async {
    await googlesignIn!.signOut();
    await auth.signOut();
  }

  // Fazer upload de uma música
  Future<void> uploadMusic(
      String title, String imageUrl, String description, int likes) async {
    String userId = auth.currentUser!.uid;

    // await FirebaseFirestore.instance.collection('music').add({
    //   'userId': userId,
    //   'title': title,
    //   'imageUrl': imageUrl,
    //   'description': description,
    //   'likes': likes,
    // });
    final musicService = FirestoreService('music');
    await musicService.criarDados({
      'userId': userId,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'likes': likes,
    });
  }

  // Obter todas as músicas do usuário
  Future<List<Map<String, dynamic>>> getMusicasUser() async {
    List<Map<String, dynamic>> musicas = [];
    String userId = auth.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('music')
        // .where('userId', isEqualTo: userId)
        .get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> musica = doc.data() as Map<String, dynamic>;
      musicas.add(musica);
    });
    // ver a lista
    print(musicas);
    return musicas;
  }

  // Obter todas as músicas do usuário
  Future<List<Map<String, dynamic>>> getMusicas() async {
    List<Map<String, dynamic>> musicas = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('music').get();

    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> musica = doc.data() as Map<String, dynamic>;

      musicas.add(musica);
    });
    // ver a lista
    print(musicas);

    return musicas;
  }

  // create playlist
  Future<void> createPlaylist(
      // int userId,
      String title,
      String type,
      String imageUrl,
      [DocumentReference? reference]) async {
    Map<String, dynamic> playlistData = {
      'userId': auth.currentUser!.uid,
      'title': title,
      'type': type,
      'imageUrl': imageUrl,
    };

    if (reference != null) {
      playlistData['reference'] = reference;
    }

    await FirebaseFirestore.instance.collection('playlists').add(playlistData);
  }

  // playlist perfil
  Future<List<Map<String, dynamic>>> getPlaylist() async {
    final playlistService = FirestoreService('playlists');
    final musicService = FirestoreService('music');

    // ir buscar todas as muscias do user
    final QuerySnapshot querySnapshot = await musicService._collection
        .where('userId', isEqualTo: auth.currentUser!.uid)
        .get();

    List<DocumentReference> musicReferences = [];

    querySnapshot.docs.forEach((doc) {
      musicReferences.add(doc.reference); //doc.id, doc.
      // musicReferences.add(doc.
    });

    // criar uma playlist
    // final playlistRef = await playlistService.criarDados({
    //   'userId': auth.currentUser!.uid,
    //   'title': 'My Playlist',
    //   'type': 'Perfil',
    //   'imageUrl': 'assets/images/background.jpg',
    //   'songs': musicReferences,
    // });

    List<Map<String, dynamic>> playlist = [];
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> playlistData = doc.data() as Map<String, dynamic>;

      playlist.add(playlistData);
    });
    // ver a lista
    print(playlist);

    return playlist;
  }

  Future<Map<String, dynamic>> getUserProfile() async {
    String userId = auth.currentUser!.uid;
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        String bio = userData['bio'] ?? '';
        List<dynamic> followers = userData['followers'] ?? [];
        int followersCount = followers.length;
        double rating = (userData['rating'] ?? 0).toDouble();

        return {
          'bio': bio,
          'followers': followersCount,
          'rating': rating,
        };
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Error retrieving user profile: $e');
    }
  }

  Future<void> updateBio(String newBio) async {
    String userId = auth.currentUser!.uid;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'bio': newBio});
    } catch (e) {
      // Lidar com qualquer erro que possa ocorrer durante a atualização
      print('Erro ao atualizar a bio: $e');
    }
  }

  // Future<String?> pickImage() async {
  //   final result = await FilePicker.platform.pickFiles(type: FileType.image);

  //   if (result != null && result.files.isNotEmpty) {
  //     final file = File(result.files.first.path!);
  //     // Aqui você pode adicionar lógica para fazer o upload da imagem para o Firebase Storage
  //     // Retorne a URL da imagem após o upload bem-sucedido
  //     // Exemplo de como fazer o upload da imagem:
  //     final storageRef =
  //         FirebaseStorage.instance.ref().child('images').child('filename.jpg');
  //     final uploadTask = storageRef.putFile(file);
  //     final snapshot = await uploadTask.whenComplete(() {});
  //     final imageUrl = await snapshot.ref.getDownloadURL();

  //     return imageUrl;
  //   } else {
  //     return null;
  //   }
  // }
}

// Classe to save the user data in the database firebase
// class User {
//   String? uid;
//   String? name;
//   String? email;
//   String? profileImage;
//   String? bio;
//   String? Nfollowers;
//   String? Nrating;
//   String? Nfollowing;
//   // String? Nposts;
//   User(
//       {this.uid,
//       this.name,
//       this.email,
//       this.profileImage,
//       this.bio,
//       this.Nfollowers,
//       this.Nrating,
//       this.Nfollowing});
//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'name': name,
//       'email': email,
//       'profileImage': profileImage,
//       'bio': bio,
//       'Nfollowers': Nfollowers,
//       'Nrating': Nrating,
//       'Nfollowing': Nfollowing,
//       // 'Nposts': Nposts,
//     };
//   }
//   User.fromFirestore(Map<String, dynamic> firestore)
//       : uid = firestore['uid'],
//         name = firestore['name'],
//         email = firestore['email'],
//         profileImage = firestore['profileImage'],
//         bio = firestore['bio'],
//         Nfollowers = firestore['Nfollowers'],
//         Nrating = firestore['Nrating'],
//         Nfollowing = firestore['Nfollowing'];
//   // Nposts = firestore['Nposts'];
// }

// class UserService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final String _collectionName = 'users';
//   Future<void> saveUserData({
//     required String uid,
//     required String name,
//     required String email,
//     required String profileImage,
//     required String bio,
//     required String Nfollowers,
//     required String Nrating,
//     required String Nfollowing,
//     // required String Nposts,
//   }) async {
//     try {
//       // Crie um documento com o UID do usuário
//       final DocumentReference userDocRef =
//           _firestore.collection(_collectionName).doc(uid);
//       // Salve os dados do usuário no documento
//       await userDocRef.set({
//         'name': name,
//         'email': email,
//         'profileImage': profileImage,
//         'bio': bio,
//         'Nfollowers': Nfollowers,
//         'Nrating': Nrating,
//         'Nfollowing': Nfollowing,
//         // 'Nposts': Nposts,
//       });
//     } catch (e) {
//       // Lide com qualquer erro de salvamento de dados aqui
//       print('Erro ao salvar os dados do usuário: $e');
//     }
//   }
// }
