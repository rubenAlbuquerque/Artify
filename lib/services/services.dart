import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package::file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
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

    QuerySnapshot querySnapshot = await users
        .where('userId', isEqualTo: userCredential.user!.uid)
        .where('verify', isEqualTo: true)
        .get();

    if (querySnapshot.size == 0) {
      // se nao hover nenhum user com verify = true,
      //entao é um novo user

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({ 
        'userId': userCredential.user!.uid,
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
  // Future<List<Map<String, dynamic>>> getMusicasUser() async {
  //   // List<Map<String, dynamic>> musicas = [];
  //   // String userId = auth.currentUser!.uid;
  //   // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //   //     .collection('music')
  //   //     // .where('userId', isEqualTo: userId)
  //   //     .get();
  //   // querySnapshot.docs.forEach((doc) {
  //   //   Map<String, dynamic> musica = doc.data() as Map<String, dynamic>;
  //   //   musicas.add(musica);
  //   // });
  //   // // ver a lista
  //   // print(musicas);
  //   // return musicas;
  //   List<Map<String, dynamic>> musicas = [];
  //   String userId = auth.currentUser!.uid;
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('playlists')
  //       .where('userId', isEqualTo: userId)
  //       .where('type', isEqualTo: 'Perfil')
  //       .get();
  //   // querySnapshot.docs.forEach((doc) {
  //   //   Map<String, dynamic> musica = doc.data() as Map<String, dynamic>;
  //   //   // musicas.add(musica);
  //   //   // utilizar o array songs da playlist que contem as referencias para obter uma lista com as informacoes das musicas
  //   // });
  //   querySnapshot.docs.forEach((doc) async {
  //     Map<String, dynamic> playlistData = doc.data() as Map<String, dynamic>;
  //     List<DocumentReference> songs = List<DocumentReference>.from(playlistData[
  //         'songs']); // Obtém o array de referências 'songs' da playlist
  //     for (DocumentReference songRef in songs) {
  //       // Obtém o documento da música
  //       DocumentSnapshot songSnapshot = await songRef.get();
  //       if (songSnapshot.exists) {
  //         Map<String, dynamic> musica =
  //             songSnapshot.data() as Map<String, dynamic>;
  //         musicas.add(musica);
  //       }
  //     }
  //   });
  //   return musicas;
  // }

  Future<List<Map<String, dynamic>>> getMusicasUser() async {
    List<Map<String, dynamic>> musicas = [];
    String userId = auth.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('playlists')
        .where('userId', isEqualTo: userId)
        .where('type', isEqualTo: 'Perfil')
        .get();

    for (DocumentSnapshot doc in querySnapshot.docs) {
      // get the id - doc.id

      // String id = doc.id;
      Map<String, dynamic> playlistData = doc.data() as Map<String, dynamic>;
      List<DocumentReference> songs = List<DocumentReference>.from(playlistData[
          'songs']); // Obtém o array de referências 'songs' da playlist

      for (DocumentReference songRef in songs) {
        // Obtém o documento da música
        DocumentSnapshot songSnapshot = await songRef.get();

        if (songSnapshot.exists) {
          // get the id
          String id = songSnapshot.id;
          Map<String, dynamic> musica =
              songSnapshot.data() as Map<String, dynamic>;
          // musicas.add({
          //   'id': id,
          //   'musica': musica,
          // });
          musica['musicId'] = id; // Adiciona o ID no mapa 'musica'
          musicas.add(musica);
        }
      }
    }

    return musicas;
  }

  // getPlaylistsUser
  Future<List<Map<String, dynamic>>> getPlaylistsUser() async {
    List<Map<String, dynamic>> playlists = [];
    String userId = auth.currentUser!.uid;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('playlists')
        .where('userId', isEqualTo: userId)
        .where('where', isEqualTo: 'library')
        .get();

    for (DocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> playlistData = doc.data() as Map<String, dynamic>;
      playlists.add(playlistData);
    }
    // imageUrl: assets/images/Capturar1.jpg
    // title: "shshsbs"
    // type : "Library"
    // userId: "Kd3NnCFzSvR81CP8Uc4Ob9HUQpi2"

    return playlists;
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
      String id = doc.id;

      String userId = doc['userId'];
      Map<String, dynamic> playlistData = doc.data() as Map<String, dynamic>;

      playlistData['musicId'] = id;
      playlistData['userId'] = userId;
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

  // Future<void> searchterm(String term) async {

  //   final musicService = FirestoreService('music');
  //   final playlist = FirestoreService('playlists');
  //   final users = FirestoreService('users');

  //   // procurar em todas as colecoes o ducumento com comece pelo term
  //   final QuerySnapshot querySnapshot = await musicService._collection
  //       .where('title', isGreaterThanOrEqualTo: term)
  //       .get();

  //   final QuerySnapshot querySnapshot2 = await playlist._collection
  //       .where('title', isGreaterThanOrEqualTo: term)
  //       .get();

  //   final QuerySnapshot querySnapshot3 = await users._collection
  //       .where('name', isGreaterThanOrEqualTo: term)
  //       .get();

  //   final List<DocumentSnapshot> musicResults = querySnapshot.docs
  //       .where((doc) => doc['title'].startsWith(term))
  //       .toList();

  //   final List<DocumentSnapshot> playlistResults = querySnapshot2.docs
  //       .where((doc) => doc['title'].startsWith(term))
  //       .toList();

  //   final List<DocumentSnapshot> usersResults = querySnapshot3.docs
  //       .where((doc) => doc['name'].startsWith(term))
  //       .toList();

  //   // Combine os resultados de todas as coleções
  //   final allResults = [...musicResults, ...playlistResults, ...usersResults];

  //  return allResults;

  // }

  Future<List<Map<String, String>>> searchterm(String term) async {
    final musicService = FirestoreService('music');
    final playlist = FirestoreService('playlists');
    final users = FirestoreService('users');

    final QuerySnapshot querySnapshot = await musicService._collection
        .where('title', isGreaterThanOrEqualTo: term)
        .get();

    final QuerySnapshot querySnapshot2 = await playlist._collection
        .where('title', isGreaterThanOrEqualTo: term)
        .get();

    final QuerySnapshot querySnapshot3 = await users._collection
        .where('name', isGreaterThanOrEqualTo: term)
        .get();

    final List<DocumentSnapshot> musicResults = querySnapshot.docs
        .where((doc) => doc['title'].startsWith(term))
        .toList();

    final List<DocumentSnapshot> playlistResults = querySnapshot2.docs
        .where((doc) => doc['title'].startsWith(term))
        .toList();

    final List<DocumentSnapshot> usersResults = querySnapshot3.docs
        .where((doc) => doc['name'].startsWith(term))
        .toList();

    // final allResults = [
    //   ...musicResults.map((doc) => doc['title'] as String),
    //   ...playlistResults.map((doc) => doc['title'] as String),
    //   ...usersResults.map((doc) => doc['name'] as String),
    // ];assets/images/3.jpg

    final List<Map<String, String>> allResults = [
      ...musicResults.map((doc) => {
            'title': doc['title'] as String,
            'type': 'music',
            'image': doc['imageUrl'] as String,
          }),
      ...playlistResults.map((doc) => {
            'title': doc['title'] as String,
            'type': 'playlist',
            'image': doc['imageUrl'] as String,
          }),
      ...usersResults.map((doc) => {
            'title': doc['name'] as String,
            'type': 'Artist',
            'image': doc['image'] as String,
          }),
    ];

    return allResults;
  }

  // Future<List<Map<String, String>>> searchtermLibrary(String term) async {
  //   final playlist = FirestoreService('playlists');
  //   final musicService = FirestoreService('music');
  //   final QuerySnapshot playlistQuerySnapshot = await playlist._collection
  //       .where('type', isEqualTo: 'library')
  //       // .where('title', isGreaterThanOrEqualTo: term)
  //       .get();
  //   // obter as infos das musicas na playlist
  //   // final List<DocumentSnapshot> playlistResults = querySnapshot2.docs
  //   //     .where((doc) => doc['title'].startsWith(term))
  //   //     .toList();
  //   final List<Map<String, String>> allResults = [];
  //   if (playlistQuerySnapshot.docs.isNotEmpty) {
  //     final playlistDoc = playlistQuerySnapshot.docs[0];
  //     final playlistId = playlistDoc.id;
  //     final List<dynamic> musicReferences =
  //         playlistDoc['songs'] as List<dynamic>;
  //     final List<String> musicIds = [];
  //     for (final reference in musicReferences) {
  //       final String musicId = reference.id;
  //       musicIds.add(musicId);
  //     }
  //     final QuerySnapshot musicQuerySnapshot = await musicService._collection
  //         .where('id', whereIn: musicIds)
  //         // .where('title', isGreaterThanOrEqualTo: term)
  //         .get();
  //     final List<Map<String, String>> filteredResults = [];
  //     for (final musicDoc in musicQuerySnapshot.docs) {
  //       final musicTitle = musicDoc['title'] as String;
  //       final musicImage = musicDoc['image'] as String;
  //       if (musicTitle.startsWith(term)) {
  //         final result = {
  //           'playlistId': playlistId,
  //           'musicTitle': musicTitle,
  //           'musicImage': musicImage,
  //         };
  //         filteredResults.add(result);
  //       }
  //     }
  //     return filteredResults;
  //   }
  // }
  Future<bool> isAssetPathValid(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (e) {
      print('Invalid asset path: $assetPath');
      return false;
    }
  }

  Future<List<Map<String, String>>> searchtermLibrary(String term) async {
    final playlist = FirestoreService('playlists');
    final musicService = FirestoreService('music');

    final QuerySnapshot playlistQuerySnapshot =
        await playlist._collection.where('type', isEqualTo: 'library').get();

    final List<Map<String, String>> allResults = [];

    if (playlistQuerySnapshot.docs.isNotEmpty) {
      final playlistDoc = playlistQuerySnapshot.docs[0];
      final playlistId = playlistDoc.id;

      final List<dynamic> musicReferences =
          playlistDoc['songs'] as List<dynamic>;

      final List<String> musicIds = [];

      for (final reference in musicReferences) {
        final String musicId = reference.id;
        musicIds.add(musicId);
      }

      // final QuerySnapshot musicQuerySnapshot =
      //     await musicService._collection.whereIn('id', musicIds).get();

      final QuerySnapshot musicQuerySnapshot = await musicService._collection
          // .where('id', whereIn: musicIds)
          // .where('title', isGreaterThanOrEqualTo: term)
          .get();

      for (final musicDoc in musicQuerySnapshot.docs) {
        final musicId = musicDoc.id;
        final musicData = musicDoc.data() as Map<String, dynamic>?;

        if (musicData != null) {
          final musicTitle = musicData['title'] as String?;
          final musicImage = musicData['imageUrl'] as String?;
          final musicDescription = musicData['description'] as String?;

          if (musicTitle != null && musicImage != null) {
            if (musicIds.contains(musicId)) {
              print('musicId: $musicId');
              print('musicTitle: $musicTitle');
              print('musicImage: $musicImage');

              final result = {
                'playlistId': playlistId,
                'musicId': musicId,
                'musicTitle': musicTitle,
                'musicImage': musicImage,
                'description': musicDescription ?? '',
              };

              print('result: $result');

              allResults.add(result);
            }
          }
        }
      }
    }

    return allResults;
  }

  Future<List<Map<String, String>>> Playlists(String term) async {
    final playlist = FirestoreService('playlists');
    final musicService = FirestoreService('music');

    final QuerySnapshot playlistQuerySnapshot =
        await playlist._collection.where('type', isEqualTo: 'playlist').get();

    final List<Map<String, String>> allResults = [];

    if (playlistQuerySnapshot.docs.isNotEmpty) {
      final playlistDoc = playlistQuerySnapshot.docs[0];
      final playlistId = playlistDoc.id;

      final List<dynamic> musicReferences =
          playlistDoc['songs'] as List<dynamic>;

      final List<String> musicIds = [];

      for (final reference in musicReferences) {
        final String musicId = reference.id;
        musicIds.add(musicId);
      }

      // final QuerySnapshot musicQuerySnapshot =
      //     await musicService._collection.whereIn('id', musicIds).get();

      final QuerySnapshot musicQuerySnapshot = await musicService._collection
          // .where('id', whereIn: musicIds)
          // .where('title', isGreaterThanOrEqualTo: term)
          .get();

      for (final musicDoc in musicQuerySnapshot.docs) {
        final musicId = musicDoc.id;
        final musicData = musicDoc.data() as Map<String, dynamic>?;

        if (musicData != null) {
          final musicTitle = musicData['title'] as String?;
          final musicImage = musicData['imageUrl'] as String?;
          final musicDescription = musicData['description'] as String?;

          if (musicTitle != null && musicImage != null) {
            if (musicIds.contains(musicId)) {
              print('musicId: $musicId');
              print('musicTitle: $musicTitle');
              print('musicImage: $musicImage');

              final result = {
                'playlistId': playlistId,
                'musicId': musicId,
                'musicTitle': musicTitle,
                'musicImage': musicImage,
                'description': musicDescription ?? '',
              };

              print('result: $result');

              allResults.add(result);
            }
          }
        }
      }
    }

    return allResults;
  }

  // recumendacoes e populares
  Future<List<Map<String, String>>> recumendacoes() async {
    // obter todas as informacoes das musicas

    final musicService = FirestoreService('music');

    final QuerySnapshot musicQuerySnapshot = await musicService._collection
        // .where('id', whereIn: musicIds)
        // .where('title', isGreaterThanOrEqualTo: term)
        .get();

    final List<Map<String, String>> allResults = [];

    for (final musicDoc in musicQuerySnapshot.docs) {
      final musicId = musicDoc.id;
      final musicData = musicDoc.data() as Map<String, dynamic>?;

      if (musicData != null) {
        final musicTitle = musicData['title'] as String?;
        final musicImage = musicData['imageUrl'] as String?;
        final musicDescription = musicData['description'] as String?;

        if (musicTitle != null && musicImage != null) {
          // print('musicId: $musicId');
          // print('musicTitle: $musicTitle');
          // print('musicImage: $musicImage');

          final result = {
            'musicId': musicId,
            'musicTitle': musicTitle,
            'musicImage': musicImage,
            'description': musicDescription ?? '',
          };

          // print('result: $result');

          allResults.add(result);
        }
      }
    }

    return allResults;
  }

  // obter todas as informacoes das ,musicas e ordenar por likes (populares)
  Future<List<Map<String, String>>> populares() async {
    final musicService = FirestoreService('music');

    final QuerySnapshot musicQuerySnapshot = await musicService._collection
        // .where('id', whereIn: musicIds)
        // .where('title', isGreaterThanOrEqualTo: term)
        .orderBy('likes', descending: true)
        .get();

    final List<Map<String, String>> allResults = [];

    for (final musicDoc in musicQuerySnapshot.docs) {
      final musicId = musicDoc.id;
      final musicData = musicDoc.data() as Map<String, dynamic>?;

      if (musicData != null) {
        final musicTitle = musicData['title'] as String?;
        final musicImage = musicData['imageUrl'] as String?;
        final musicDescription = musicData['description'] as String?;

        if (musicTitle != null && musicImage != null) {
          // print('musicId: $musicId');
          // print('musicTitle: $musicTitle');
          // print('musicImage: $musicImage');

          final result = {
            'musicId': musicId,
            'musicTitle': musicTitle,
            'musicImage': musicImage,
            'description': musicDescription ?? '',
          };

          // print('result: $result');

          allResults.add(result);
        }
      }
    }

    return allResults;
  }

  // obter informacoes da musica a partir do id
  Future<bool> idInLikes(String musicId) async {
    final musicService = FirestoreService('music');

    final DocumentSnapshot musicDoc =
        await musicService._collection.doc(musicId).get();

    if (!musicDoc.exists) {
      return false; // The music document doesn't exist
    }

    final List<dynamic> likes =
        (musicDoc.data()! as Map<String, dynamic>)['likes'] as List<dynamic>? ??
            [];

    final String targetId = auth.currentUser!.uid; // ID you want to check

    return likes.contains(targetId);
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

