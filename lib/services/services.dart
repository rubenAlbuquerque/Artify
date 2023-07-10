import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // google sign in service
  // signInWithGoogle() async {
  //   // begin interaction with google sign in
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;

  //   // obtain google sign in credentials
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   // sign in to firebase with google credentials
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  // google sign in service
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Inicie o processo de autenticação com o Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Faça o login no Firebase com as credenciais do Google
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        // Verifique se o e-mail do usuário foi verificado
        if (user.emailVerified) {
          // O usuário está autenticado e o e-mail foi verificado
          return userCredential;
        } else {
          // Caso o e-mail não esteja verificado, deslogue o usuário
          await FirebaseAuth.instance.signOut();
          return null;
        }
      }
      return null;
    } catch (e) {
      // Trate erros de autenticação aqui
      print('Erro de autenticação: $e');
      return null;
    }
  }
}
