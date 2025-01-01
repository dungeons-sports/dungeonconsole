import 'package:dungeonconsole/models/modelBooking/model.booking.dart';
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

  Future<List<Console>?> getListedConsoles(String cafeId);

  Future<List<Booking>> getBookings(
      String cafeId, String consoleId, String date);

  Future<List<Booking>> getBookingsByDate(String cafeId, String date);

  Future<Console?> findAvailableConsole(String cafeId, ConsoleCategory category,
      Timestamp startTime, Timestamp endTime);

  Future<Booking?> createBooking(
    String cafeId,
    ConsoleCategory category,
    Timestamp startTime,
    Timestamp endTime, {
    String? customerId,
    String? customerName,
    String? contactNumber,
  });
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
                tsCreated: DateTime.now().toIso8601String(),
                tsUpdated: DateTime.now().toIso8601String(),
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

  @override
  Future<List<Console>?> getListedConsoles(String cafeId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('cafes')
          .doc(cafeId)
          .collection('consoles')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs
            .map((doc) => Console.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Booking>> getBookings(
      String cafeId, String consoleId, String date) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('cafes')
          .doc(cafeId)
          .collection('consoles')
          .doc(consoleId)
          .collection(date)
          .get();

      return querySnapshot.docs.map((doc) {
        return Booking.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<Console?> findAvailableConsole(String cafeId, ConsoleCategory category,
      Timestamp startTime, Timestamp endTime) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Fetch all consoles of the given category
      QuerySnapshot consoleSnapshot = await firestore
          .collection('cafes')
          .doc(cafeId)
          .collection('consoles')
          .where('type', isEqualTo: category.name)
          .get();

      for (var consoleDoc in consoleSnapshot.docs) {
        final console =
            Console.fromJson(consoleDoc.data() as Map<String, dynamic>);

        // Fetch bookings for the console on the same date as startTime
        String bookingDate =
            startTime.toDate().toIso8601String().split('T')[0];
        List<Booking> bookings =
            await getBookings(cafeId, console.consoleId, bookingDate);

        // Check for slot availability
        bool isAvailable = bookings.every((booking) {
          return booking.endTime.compareTo(startTime) <= 0 ||
              booking.startTime.compareTo(endTime) >= 0;
        });

        if (isAvailable) {
          return console; // Return the first available console
        }
      }

      return null; // No available console found
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<Booking?> createBooking(
    String cafeId,
    ConsoleCategory category,
    Timestamp startTime,
    Timestamp endTime, {
    String? customerId,
    String? customerName,
    String? contactNumber,
  }) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      // Find the first available console
      Console? availableConsole =
          await findAvailableConsole(cafeId, category, startTime, endTime);

      if (availableConsole == null) {
        return null; // No console available
      }

      // Prepare booking document
      String bookingId =
          'booking_${cafeId}_${availableConsole.consoleId}_${startTime.toDate().toIso8601String()}';
      String bookingDate =
          startTime.toDate().toIso8601String().split('T')[0];

      // Calculate the cost of booking
      double hourlyCost = availableConsole.cost;
      double duration =
          endTime.toDate().difference(startTime.toDate()).inHours.toDouble();
      double totalCost = hourlyCost * duration;

      Booking newBooking = Booking(
        bookingId: bookingId,
        consoleId: availableConsole.consoleId,
        consoleName: availableConsole.name,
        cafeId: cafeId,
        startTime: startTime,
        status: BookingStatus.confirmed,
        endTime: endTime,
        customerId: customerId ?? "CAFE_BOOKED",
        customerName: customerName ?? "CAFE_BOOKED",
        contactNumber: contactNumber ?? "CAFE_BOOKED",
        cost: totalCost,
        tsCreated: DateTime.now().toIso8601String(),
        tsUpdated: DateTime.now().toIso8601String(),
      );

      // Save booking to Firestore
      DocumentReference bookingRef = firestore
          .collection('cafes')
          .doc(cafeId)
          .collection('consoles')
          .doc(availableConsole.consoleId)
          .collection(bookingDate)
          .doc(bookingId);

      await bookingRef.set(newBooking.toJson());

      return newBooking; // Booking successfully created
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Booking>> getBookingsByDate(String cafeId, String date) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get all consoles for the given cafe
      final consolesSnapshot = await firestore
          .collection('cafes')
          .doc(cafeId)
          .collection('consoles')
          .get();

      List<Booking> bookings = [];

      // Loop through each console and fetch bookings for the given date
      for (var consoleDoc in consolesSnapshot.docs) {
        final consoleId = consoleDoc.id;

        // Fetch bookings for the given date in the console's sub-collection
        final bookingsSnapshot = await firestore
            .collection('cafes')
            .doc(cafeId)
            .collection('consoles')
            .doc(consoleId)
            .collection(date)
            .orderBy('endTime', descending: true)
            .get();

        // Convert each booking document into a Booking object and add to the list
        bookings.addAll(bookingsSnapshot.docs.map((doc) {
          return Booking.fromJson(doc.data());
        }));
      }

      return bookings;
    } catch (e) {
      print('Error fetching bookings: $e');
      rethrow;
    }
  }
}
