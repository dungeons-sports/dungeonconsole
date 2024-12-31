import 'package:dungeonconsole/models/modelCafe/model.cafe.dart';
import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreService {
  Future<AppUser?> createUserRecord(
    User user, {
    bool isPlayer,
    bool isCafe,
  });

  Future<AppUser?> getUserRecord(String userId);

  Future<void> createCafeRecord(Cafe cafeDetails, String uid);

  Future<void> createConsoleRecord(List<Console> consoles, String cafeId);

  Future<void> updateConsoleRecord(Console console, String cafeId);

  Future<void> updateCafeRecord(Cafe cafeDetails);

  Future<Cafe> getCafeRecord(String cafeId);
}

class FirestoreServiceImpl extends FirestoreService {
  @override
  Future<AppUser?> createUserRecord(User user,
      {bool isPlayer = false, bool isCafe = false}) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return AppUser.fromJson(userDoc.data() as Map<String, dynamic>);
      }

      AppUser appUser = AppUser(
        id: user.uid,
        email: user.email!,
        isPlayer: isPlayer,
        isCafe: isCafe,
        cafeId: "TBD",
        tsCreated: DateTime.now().toIso8601String(),
        tsUpdated: DateTime.now().toIso8601String(),
      );

      await firestore.collection('users').doc(user.uid).set(appUser.toJson());
      return appUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<AppUser?> getUserRecord(String userId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot doc =
          await firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        return AppUser.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> createCafeRecord(Cafe cafeDetails, String uid) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore
          .collection('cafes')
          .doc(cafeDetails.id)
          .set(cafeDetails.toJson(), SetOptions(merge: true));
      await firestore
          .collection('users')
          .doc(uid)
          .set({'cafeId': cafeDetails.id}, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updateCafeRecord(Cafe cafeDetails) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      Cafe updatedCafeDetails =
          cafeDetails.copyWith(tsUpdated: DateTime.now().toIso8601String());
      await firestore
          .collection('cafes')
          .doc(cafeDetails.id)
          .set(updatedCafeDetails.toJson(), SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<Cafe> getCafeRecord(String cafeId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot doc =
          await firestore.collection('cafes').doc(cafeId).get();

      if (doc.exists) {
        return Cafe.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Cafe not found');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> createConsoleRecord(
      List<Console> consoles, String cafeId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final WriteBatch batch = firestore.batch();

      for (var console in consoles) {
        final consoleRef = firestore
            .collection('cafes')
            .doc(cafeId)
            .collection('consoles')
            .doc(console.consoleId);

        batch.set(
          consoleRef,
          console
              .copyWith(
                tsCreated: DateTime.now().toUtc().toString(),
                tsUpdated: DateTime.now().toUtc().toString(),
              )
              .toJson(),
          SetOptions(merge: true),
        );
      }

      // Commit all batched writes
      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateConsoleRecord(Console console, String cafeId) async {
    try {
      try {
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore
            .collection('cafes')
            .doc(cafeId)
            .collection('consoles')
            .doc(console.consoleId)
            .set(console.toJson(), SetOptions(merge: true));
      } catch (e) {
        rethrow;
      }
    } catch (e) {}
  }
}
