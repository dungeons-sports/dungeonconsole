import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Future<AppUser?> signUpWithEmailPassword(
    String email,
    String password,
    bool isPartner,
  );
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> signUpWithGoogle(bool isPartner);
  Future<AppUser?> loginWithGoogle();
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}

class AuthenticationServiceImpl extends AuthenticationService {
  @override
  Future<AppUser?> signUpWithEmailPassword(
      String email, String password, bool isPartner) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser? appUser = await locator.get<FirestoreService>().createUserRecord(
          userCredential.user!,
          isCafe: isPartner,
          isPlayer: !isPartner);
      return appUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser? appUser = await locator
          .get<FirestoreService>()
          .getUserRecord(userCredential.user!.uid);
      return appUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AppUser?> signUpWithGoogle(bool isPartner) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      final userCredential =
          await firebaseAuth.signInWithPopup(GoogleAuthProvider());
      final User user = userCredential.user!;
      final AppUser? appuser = await locator
          .get<FirestoreService>()
          .createUserRecord(user, isCafe: isPartner, isPlayer: !isPartner);
      return appuser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AppUser?> loginWithGoogle() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      final userCredential =
          await firebaseAuth.signInWithPopup(GoogleAuthProvider());
      final User user = userCredential.user!;
      final AppUser? appuser =
          await locator.get<FirestoreService>().getUserRecord(user.uid);
      return appuser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> logout() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signOut();
      // await googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      String? uid = firebaseAuth.currentUser?.uid ?? "";
      if (uid != "") {
        return await locator.get<FirestoreService>().getUserRecord(uid);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
