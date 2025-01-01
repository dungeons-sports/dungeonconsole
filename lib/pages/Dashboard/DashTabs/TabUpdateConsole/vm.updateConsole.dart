import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VMUpdateConsole extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;
  set selectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  Future<bool?> updateConsole(
      String consoleId, String consoleName, String consoleStatus) async {
    if (_isLoading) {
      return null;
    }

    try {
      _isLoading = true;
      notifyListeners();

      // Call the Firestore service to update the console
      // final firestoreService = locator.get<FirestoreService>();
      // await firestoreService.updateConsole(consoleId, consoleName, consoleStatus);

      _isLoading = false;
      notifyListeners();

      return true;
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
