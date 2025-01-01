import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelCafe/model.cafe.dart';
import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/foundation.dart';

class VMDashboard extends ChangeNotifier {
  int _currentTab = 0;
  int get currentTab => _currentTab;

  AppUser? appUser;
  Cafe? cafeDetails;
  List<Console> listedConsoles = [];

  set currentTab(int value) {
    if (value != _currentTab) {
      _currentTab = value;
      notifyListeners();
    }
  }

  Future<bool> fetchCafeDetails() async {
    if(appUser!= null){
      return true;
    }
    try {
      // get the AppUser from authentication service
      appUser =
          await locator.get<AuthenticationService>().getCurrentUser();

      if (appUser != null && appUser!.isCafe && (appUser!.cafeId != null || appUser!.cafeId != "")) {
        // Fetch the Cafe details
        cafeDetails = await locator.get<FirestoreService>().getCafeRecord(appUser!.cafeId!);
        listedConsoles = await locator.get<FirestoreService>().getListedConsoles(appUser!.cafeId!)??[];
        notifyListeners();
        return true;  
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
