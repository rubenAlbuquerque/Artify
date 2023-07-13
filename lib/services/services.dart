import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn? googlesignIn = GoogleSignIn();

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

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'email': userCredential.user!.email,
      'teste': "Lisbon",
      "seguidores": "0",
      "verify": true
    });

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
        'email': userCredential.user!.email,
        'teste': "Lisbon",
        "seguidores": "0",
        "verify": true
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': userCredential.user!.displayName,
        'email': userCredential.user!.email,
        'image':
            "https://example.com/profile.jpg",
        'bio': "I love music!", 
        'numFollowers': 0, 
        'rating': 0, 
        'musicas': ["song1", "song2", "song3"],
        'albums': [
          "album1",
          "album2",
          "album3"
        ],
        'playlists': [
          "playlist1",
          "playlist2",
          "playlist3"
        ],
        'verify': true
      });
    };

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
