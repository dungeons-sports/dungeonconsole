import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationService {
  Future<User?> signUpWithEmailPassword(String email, String password);
  Future<User?> loginWithEmailPassword(String email, String password);
  Future<User?> signUpWithGoogle();
  Future<User?> loginWithGoogle();
  Future<void> logout();
}

class AuthenticationServiceImpl extends AuthenticationService {
  @override
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<User?> loginWithEmailPassword(String email, String password) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<User?> signUpWithGoogle() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<User?> loginWithGoogle() async {
    return signUpWithGoogle();
  }

  @override
  Future<void> logout() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }
}
