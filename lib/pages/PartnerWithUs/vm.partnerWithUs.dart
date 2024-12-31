import 'package:dungeonconsole/helpers/helper.docId.dart';
import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelCafe/model.cafe.dart';
import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:dungeonconsole/services/service.firestore.dart';
import 'package:flutter/material.dart';

class VMPartnerWithUs extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Cafe cafeDetails = const Cafe.empty();

  final TextEditingController cafeNameController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();

  // Step Two Controllers
  final TextEditingController pcCountController = TextEditingController();
  final TextEditingController pcAmountController = TextEditingController();
  final TextEditingController psCountController = TextEditingController();
  final TextEditingController psAmountController = TextEditingController();
  final TextEditingController vrCountController = TextEditingController();
  final TextEditingController vrAmountController = TextEditingController();
  final TextEditingController xboxCountController = TextEditingController();
  final TextEditingController xboxAmountController = TextEditingController();
  final TextEditingController streamingCountController =
      TextEditingController();
  final TextEditingController streamingAmountController =
      TextEditingController();
  final TextEditingController simRacingCountController =
      TextEditingController();
  final TextEditingController simRacingAmountController =
      TextEditingController();
  // END - Step Two Controllers

  final TextEditingController topGameController = TextEditingController();
  final TextEditingController googleMapsController = TextEditingController();

  List<String> get cities => [
        'Agra',
        'Ahmedabad',
        'Bengaluru',
        'Bhopal',
        'Chennai',
        'Delhi',
        'Ghaziabad',
        'Hyderabad',
        'Indore',
        'Jaipur',
        'Kanpur',
        'Kolkata',
        'Lucknow',
        'Ludhiana',
        'Mumbai',
        'Nagpur',
        'Patna',
        'Pune',
        'Vadodara',
        'Visakhapatnam'
      ];

  List<String> get states => [
        'Andhra Pradesh',
        'Arunachal Pradesh',
        'Assam',
        'Bihar',
        'Chhattisgarh',
        'Goa',
        'Gujarat',
        'Haryana',
        'Himachal Pradesh',
        'Jharkhand',
        'Karnataka',
        'Kerala',
        'Madhya Pradesh',
        'Maharashtra',
        'Manipur',
        'Meghalaya',
        'Mizoram',
        'Nagaland',
        'Odisha',
        'Punjab',
        'Rajasthan',
        'Sikkim',
        'Tamil Nadu',
        'Telangana',
        'Tripura',
        'Uttar Pradesh',
        'Uttarakhand',
        'West Bengal'
      ];

  List<String> yn = ["Yes", "No"];

  String _openTimeUTC = 'TBD';
  String _closeTimeUTC = 'TBD';
  String _city = '';
  String _state = '';

  bool _isPSConsoleAvailable = false;
  bool _isPCAvailable = false;
  bool _isVRAvailable = false;
  bool _isXboxAvailable = false;
  bool _isStreamingAvailable = false;
  bool _isSimRacingAvailable = false;

  bool get isPSConsoleAvailable => _isPSConsoleAvailable;
  bool get isPCAvailable => _isPCAvailable;
  bool get isVRAvailable => _isVRAvailable;
  bool get isXboxAvailable => _isXboxAvailable;
  bool get isStreamingAvailable => _isStreamingAvailable;
  bool get isSimRacingAvailable => _isSimRacingAvailable;

  bool _isGamingChair = false;
  bool _isWashroom = false;
  bool _isAC = false;
  bool _isParking = false;
  bool _isFoodAllowed = false;
  bool _isAlwaysOpen = false;
  bool _isSmokingAllowed = false;

  bool get isGamingChair => _isGamingChair;
  set isGamingChair(bool value) {
    _isGamingChair = value;
    notifyListeners();
  }

  bool get isWashroom => _isWashroom;
  set isWashroom(bool value) {
    _isWashroom = value;
    notifyListeners();
  }

  bool get isAC => _isAC;
  set isAC(bool value) {
    _isAC = value;
    notifyListeners();
  }

  bool get isParking => _isParking;
  set isParking(bool value) {
    _isParking = value;
    notifyListeners();
  }

  bool get isFoodAllowed => _isFoodAllowed;
  set isFoodAllowed(bool value) {
    _isFoodAllowed = value;
    notifyListeners();
  }

  bool get isAlwaysOpen => _isAlwaysOpen;
  set isAlwaysOpen(bool value) {
    _isAlwaysOpen = value;
    notifyListeners();
  }

  bool get isSmokingAllowed => _isSmokingAllowed;
  set isSmokingAllowed(bool value) {
    _isSmokingAllowed = value;
    notifyListeners();
  }

  int _currentStep = 0;

  int get currentStep => _currentStep;

  void nextStep() {
    if (_currentStep < 2) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  TextEditingController get getCafeNameController => cafeNameController;
  TextEditingController get getOwnerNameController => ownerNameController;
  TextEditingController get getOwnerPhoneController => ownerPhoneController;

  TextEditingController get getPcCountController => pcCountController;
  TextEditingController get getPcAmountController => pcAmountController;
  TextEditingController get getPsCountController => psCountController;
  TextEditingController get getPsAmountController => psAmountController;
  TextEditingController get getVrCountController => vrCountController;
  TextEditingController get getVrAmountController => vrAmountController;
  TextEditingController get getXboxCountController => xboxCountController;
  TextEditingController get getXboxAmountController => xboxAmountController;
  TextEditingController get getStreamingCountController =>
      streamingCountController;
  TextEditingController get getStreamingAmountController =>
      streamingAmountController;
  TextEditingController get getSimRacingCountController =>
      simRacingCountController;
  TextEditingController get getSimRacingAmountController =>
      simRacingAmountController;

  TextEditingController get getTopGamesController => topGameController;
  TextEditingController get getGoogleMapsController => googleMapsController;

  void setControllerValues(
      {String? cafeName, String? ownerName, String? ownerPhoneNumber}) {
    if (cafeName != null) {
      cafeNameController.text = cafeName;
    }
    if (ownerName != null) {
      ownerNameController.text = ownerName;
    }
    if (ownerPhoneNumber != null) {
      ownerPhoneController.text = ownerPhoneNumber;
    }
  }

  String get city => _city;
  set city(String value) {
    _city = value;
    notifyListeners();
  }

  String get state => _state;
  set state(String value) {
    _state = value;
    notifyListeners();
  }

  String get openTimeUTC => _openTimeUTC;
  set openTimeUTC(String value) {
    _openTimeUTC = value;
    notifyListeners();
  }

  String get closeTimeUTC => _closeTimeUTC;
  set closeTimeUTC(String value) {
    _closeTimeUTC = value;
    notifyListeners();
  }

  final List<ConsoleCategory> _availableConsoles = [];
  final List<Console> _consoles = [];
  List<Console> get consoles => _consoles;

  void addAvailableConsole(ConsoleCategory category) {
    // Set the UI values
    switch (category) {
      case ConsoleCategory.pc:
        _isPCAvailable = true;
      case ConsoleCategory.ps:
        _isPSConsoleAvailable = true;
      case ConsoleCategory.vr:
        _isVRAvailable = true;
      case ConsoleCategory.xbox:
        _isXboxAvailable = true;
      case ConsoleCategory.streaming:
        _isStreamingAvailable = true;
      case ConsoleCategory.simRacing:
        _isSimRacingAvailable = true;
    }
    _availableConsoles.add(category);
  }

  void removeAvailableConsole(ConsoleCategory category) {
    // Set the UI values
    switch (category) {
      case ConsoleCategory.pc:
        _isPCAvailable = false;
      case ConsoleCategory.ps:
        _isPSConsoleAvailable = false;
      case ConsoleCategory.vr:
        _isVRAvailable = false;
      case ConsoleCategory.xbox:
        _isXboxAvailable = false;
      case ConsoleCategory.streaming:
        _isStreamingAvailable = false;
      case ConsoleCategory.simRacing:
        _isSimRacingAvailable = false;
    }
    _availableConsoles.remove(category);
  }

  Future<bool> fetchRequiredDetails() async {
    AppUser? user = await locator.get<AuthenticationService>().getCurrentUser();
    if (user != null) {
      if (user.cafeId != null && user.cafeId != "") {
        cafeDetails =
            await locator.get<FirestoreService>().getCafeRecord(user.cafeId!);
        _currentStep = cafeDetails.registerStep;
        notifyListeners();
      }
    }
    return !(user == null);
  }

  Future<void> submit() async {
    if (_isLoading) {
      return;
    }

    if (_city.isEmpty || _state.isEmpty) {
      // Handle validation error
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      String id = StringHelper.generateDocId();

      // ignore: unused_local_variable
      cafeDetails = cafeDetails.copyWith(
        id: id,
        ownerName: ownerNameController.text,
        ownerPhone: ownerPhoneController.text,
        cafeName: cafeNameController.text,
        city: _city,
        state: _state,
        registerStep: 1,
        tsCreated: DateTime.now().toUtc().toString(),
        tsUpdated: DateTime.now().toUtc().toString(),
      );

      AppUser? user =
          await locator.get<AuthenticationService>().getCurrentUser();

      if (user != null) {
        await locator
            .get<FirestoreService>()
            .createCafeRecord(cafeDetails, user.id);
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void createConsoleWithCount(
      ConsoleCategory category, int count, double cost) {
    for (int i = 0; i < count; i++) {
      String consoleId = StringHelper.generateDocId();
      _consoles.add(
        Console(
          type: category,
          consoleId: 'console_$consoleId',
          multiplayer: false,
          cost: cost,
          tsCreated: '',
          tsUpdated: '',
        ),
      );
    }
  }

  Future<void> submitInventoryInfo() async {
    if (_isLoading) {
      return;
    }
    try {
      _isLoading = true;
      notifyListeners();

      for (ConsoleCategory category in _availableConsoles) {
        switch (category) {
          case ConsoleCategory.pc:
            int count = int.tryParse(pcCountController.text) ?? 0;
            double cost = double.tryParse(pcAmountController.text) ?? 0.0;
            createConsoleWithCount(category, count, cost);
            break;
          case ConsoleCategory.ps:
            int count = int.tryParse(psCountController.text) ?? 0;
            double cost = double.tryParse(psAmountController.text) ?? 0.0;
            createConsoleWithCount(category, count, cost);
            break;
          case ConsoleCategory.vr:
            int count = int.tryParse(vrCountController.text) ?? 0;
            double cost = double.tryParse(vrAmountController.text) ?? 0.0;
            createConsoleWithCount(category, count, cost);
            break;
          case ConsoleCategory.xbox:
            int count = int.tryParse(xboxCountController.text) ?? 0;
            double cost = double.tryParse(xboxAmountController.text) ?? 0.0;
            createConsoleWithCount(category, count, cost);
            break;
          case ConsoleCategory.streaming:
            int count = int.tryParse(streamingCountController.text) ?? 0;
            double cost =
                double.tryParse(streamingAmountController.text) ?? 0.0;
            createConsoleWithCount(category, count, cost);
            break;
          case ConsoleCategory.simRacing:
            int count = int.tryParse(simRacingCountController.text) ?? 0;
            double cost =
                double.tryParse(simRacingAmountController.text) ?? 0.0;
            createConsoleWithCount(category, count, cost);
            break;
        }
      }

      final firestoreService = locator.get<FirestoreService>();
      await firestoreService.createConsoleRecord(
          _consoles, cafeDetails.id);

      await firestoreService.updateCafeRecord(cafeDetails.copyWith(
          registerStep: 2, tsUpdated: DateTime.now().toUtc().toString()));

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  void submitFinal() async {
    if (_isLoading) {
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      Cafe updatedCafeDetails = cafeDetails.copyWith(
        tsUpdated: DateTime.now().toUtc().toString(),
        openTimeUTC: _openTimeUTC,
        closeTimeUTC: _closeTimeUTC,
        isGamingChair: _isGamingChair,
        isWashroom: _isWashroom,
        isAC: _isAC,
        isParking: _isParking,
        isFoodAllowed: _isFoodAllowed,
        isAlwaysOpen: _isAlwaysOpen,
        isSmokingAllowed: _isSmokingAllowed,
        topGames: topGameController.text,
        registerStep: -1,
        googleMapsLink: googleMapsController.text,
      );

      await locator
          .get<FirestoreService>()
          .updateCafeRecord(updatedCafeDetails);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  @override
  void dispose() {
    cafeNameController.dispose();
    ownerNameController.dispose();
    ownerPhoneController.dispose();
    pcCountController.dispose();
    pcAmountController.dispose();
    psCountController.dispose();
    psAmountController.dispose();
    vrCountController.dispose();
    vrAmountController.dispose();
    xboxCountController.dispose();
    xboxAmountController.dispose();
    streamingCountController.dispose();
    streamingAmountController.dispose();
    simRacingCountController.dispose();
    simRacingAmountController.dispose();
    topGameController.dispose();
    googleMapsController.dispose();
    super.dispose();
  }
}
