import 'package:cloud_firestore/cloud_firestore.dart';
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

  bool _isStepOneSuccess = false;
  bool _isStepTwoSuccess = false;
  bool _isStepThreeSuccess = false;

  bool get isStepOneSuccess => _isStepOneSuccess;
  bool get isStepTwoSuccess => _isStepTwoSuccess;
  bool get isStepThreeSuccess => _isStepThreeSuccess;

  bool _showErrorSnackbar = false;
  bool get showErrorSnackbar => _showErrorSnackbar;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  bool _isCafeNameError = false;
  bool _isOwnerNameError = false;
  bool _isOwnerPhoneError = false;
  bool _isCityError = false;
  bool _isDeviceSelectedError = false;
  bool _isPcCountError = false;
  bool _isPcAmountError = false;
  bool _isPsCountError = false;
  bool _isPsAmountError = false;
  bool _isVrCountError = false;
  bool _isVrAmountError = false;
  bool _isXboxCountError = false;
  bool _isXboxAmountError = false;
  bool _isStreamingCountError = false;
  bool _isStreamingAmountError = false;
  bool _isSimRacingCountError = false;
  bool _isSimRacingAmountError = false;
  bool _isTopGameError = false;
  bool _isGoogleMapsError = false;
  bool _isOpeningTimeError = false;
  bool _isClosingTimeError = false;

  bool get isCafeNameError => _isCafeNameError;
  bool get isOwnerNameError => _isOwnerNameError;
  bool get isOwnerPhoneError => _isOwnerPhoneError;
  bool get isCityError => _isCityError;
  bool get isDeviceSelectedError => _isDeviceSelectedError;
  bool get isPcCountError => _isPcCountError;
  bool get isPcAmountError => _isPcAmountError;
  bool get isPsCountError => _isPsCountError;
  bool get isPsAmountError => _isPsAmountError;
  bool get isVrCountError => _isVrCountError;
  bool get isVrAmountError => _isVrAmountError;
  bool get isXboxCountError => _isXboxCountError;
  bool get isXboxAmountError => _isXboxAmountError;
  bool get isStreamingCountError => _isStreamingCountError;
  bool get isStreamingAmountError => _isStreamingAmountError;
  bool get isSimRacingCountError => _isSimRacingCountError;
  bool get isSimRacingAmountError => _isSimRacingAmountError;
  bool get isTopGameError => _isTopGameError;
  bool get isGoogleMapsError => _isGoogleMapsError;
  bool get isOpeningTimeError => _isOpeningTimeError;
  bool get isClosingTimeError => _isClosingTimeError;

  set isCafeNameError(bool value) {
    _isCafeNameError = value;
    notifyListeners();
  }

  set isOwnerNameError(bool value) {
    _isOwnerNameError = value;
    notifyListeners();
  }

  set isOwnerPhoneError(bool value) {
    _isOwnerPhoneError = value;
    notifyListeners();
  }

  set isPcCountError(bool value) {
    _isPcCountError = value;
    notifyListeners();
  }

  set isPcAmountError(bool value) {
    _isPcAmountError = value;
    notifyListeners();
  }

  set isPsCountError(bool value) {
    _isPsCountError = value;
    notifyListeners();
  }

  set isPsAmountError(bool value) {
    _isPsAmountError = value;
    notifyListeners();
  }

  set isVrCountError(bool value) {
    _isVrCountError = value;
    notifyListeners();
  }

  set isVrAmountError(bool value) {
    _isVrAmountError = value;
    notifyListeners();
  }

  set isXboxCountError(bool value) {
    _isXboxCountError = value;
    notifyListeners();
  }

  set isXboxAmountError(bool value) {
    _isXboxAmountError = value;
    notifyListeners();
  }

  set isStreamingCountError(bool value) {
    _isStreamingCountError = value;
    notifyListeners();
  }

  set isStreamingAmountError(bool value) {
    _isStreamingAmountError = value;
    notifyListeners();
  }

  set isSimRacingCountError(bool value) {
    _isSimRacingCountError = value;
    notifyListeners();
  }

  set isSimRacingAmountError(bool value) {
    _isSimRacingAmountError = value;
    notifyListeners();
  }

  set isTopGameError(bool value) {
    _isTopGameError = value;
    notifyListeners();
  }

  set isGoogleMapsError(bool value) {
    _isGoogleMapsError = value;
    notifyListeners();
  }

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

  String _openTime = '';
  String _closeTime = '';
  String _city = '';

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

  String get openTime => _openTime;
  set openTime(String value) {
    _openTime = value;
    notifyListeners();
  }

  String get closeTime => _closeTime;
  set closeTime(String value) {
    _closeTime = value;
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
        try {
          cafeDetails =
              await locator.get<FirestoreService>().getCafeRecord(user.cafeId!);
          _currentStep = cafeDetails.registerStep;
          notifyListeners();
        } catch (e) {
          // Do nothing.
        }
      }
    }
    return !(user == null);
  }

  bool validateSubmitFields() {
    bool isValid = true;

    if (cafeNameController.text.isEmpty) {
      isCafeNameError = true;
      isValid = false;
      _errorMessage = "Cafe Name cannot be empty";
      notifyListeners();
      return isValid;
    } else {
      isCafeNameError = false;
    }

    if (_city.isEmpty) {
      _isCityError = true;
      isValid = false;
      _errorMessage = "City cannot be empty";
      notifyListeners();
      return isValid;
    } else {
      _isCityError = false;
    }

    if (ownerNameController.text.isEmpty) {
      isOwnerNameError = true;
      isValid = false;
      _errorMessage = "Owner Name cannot be empty";
      notifyListeners();
      return isValid;
    } else {
      isOwnerNameError = false;
    }

    if (ownerPhoneController.text.isEmpty) {
      _errorMessage = "Phone number cannot be empty";
      isOwnerPhoneError = true;
      isValid = false;
    } else if (ownerPhoneController.text.length != 10) {
      _errorMessage = "Invalid Phone number";
      isOwnerPhoneError = true;
      isValid = false;
      notifyListeners();
      return isValid;
    } else {
      isOwnerPhoneError = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<void> submit() async {
    if (_isLoading) {
      return;
    }

    if (!validateSubmitFields()) {
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
        registerStep: 1,
        tsCreated: DateTime.now().toIso8601String().toString(),
        tsUpdated: DateTime.now().toIso8601String().toString(),
      );

      AppUser? user =
          await locator.get<AuthenticationService>().getCurrentUser();

      if (user != null) {
        await locator
            .get<FirestoreService>()
            .createCafeRecord(cafeDetails, user.id);
        _isStepOneSuccess = true;
      }

      _isLoading = false;
      notifyListeners();
    } on FirebaseException catch (_) {
      _errorMessage = "Something went wrong";
      _showErrorSnackbar = true;
      notifyListeners();
    }
  }

  void createConsoleWithCount(
      ConsoleCategory category, int count, double cost) {
    for (int i = 0; i < count; i++) {
      String consoleId = StringHelper.generateDocId();
      _consoles.add(
        Console(
          type: category,
          name: '${category.name}_${i + 1}',
          consoleId: 'console_$consoleId',
          multiplayer: false,
          cost: cost,
          tsCreated: '',
          tsUpdated: '',
        ),
      );
    }
  }

  bool validateSubmitInventoryInfo() {
    bool isValid = true;

    if (_availableConsoles.isEmpty) {
      _errorMessage = "Please select a device.";
      _isDeviceSelectedError = true;
      isValid = false;
      notifyListeners();
      return isValid;
    } else {
      _isDeviceSelectedError = false;
    }

    if (_isPCAvailable) {
      if (pcCountController.text.isEmpty ||
          int.tryParse(pcCountController.text) == null) {
        _isPcCountError = true;
        _errorMessage = "PC count is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isPcCountError = false;
      }

      if (pcAmountController.text.isEmpty ||
          double.tryParse(pcAmountController.text) == null) {
        _isPcAmountError = true;
        _errorMessage = "PC amount is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isPcAmountError = false;
      }
    }

    if (_isPSConsoleAvailable) {
      if (psCountController.text.isEmpty ||
          int.tryParse(psCountController.text) == null) {
        _isPsCountError = true;
        _errorMessage = "PS count is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isPsCountError = false;
      }

      if (psAmountController.text.isEmpty ||
          double.tryParse(psAmountController.text) == null) {
        _isPsAmountError = true;
        _errorMessage = "PS amount is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isPsAmountError = false;
      }
    }

    if (_isVRAvailable) {
      if (vrCountController.text.isEmpty ||
          int.tryParse(vrCountController.text) == null) {
        _isVrCountError = true;
        _errorMessage = "VR count is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isVrCountError = false;
      }

      if (vrAmountController.text.isEmpty ||
          double.tryParse(vrAmountController.text) == null) {
        _isVrAmountError = true;
        _errorMessage = "VR amount is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isVrAmountError = false;
      }
    }

    if (_isXboxAvailable) {
      if (xboxCountController.text.isEmpty ||
          int.tryParse(xboxCountController.text) == null) {
        _isXboxCountError = true;
        _errorMessage = "Xbox count is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isXboxCountError = false;
      }

      if (xboxAmountController.text.isEmpty ||
          double.tryParse(xboxAmountController.text) == null) {
        _isXboxAmountError = true;
        _errorMessage = "Xbox amount is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isXboxAmountError = false;
      }
    }

    if (_isStreamingAvailable) {
      if (streamingCountController.text.isEmpty ||
          int.tryParse(streamingCountController.text) == null) {
        _isStreamingCountError = true;
        _errorMessage = "Streaming count is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isStreamingCountError = false;
      }

      if (streamingAmountController.text.isEmpty ||
          double.tryParse(streamingAmountController.text) == null) {
        _isStreamingAmountError = true;
        _errorMessage = "Streaming amount is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isStreamingAmountError = false;
      }
    }

    if (_isSimRacingAvailable) {
      if (simRacingCountController.text.isEmpty ||
          int.tryParse(simRacingCountController.text) == null) {
        _isSimRacingCountError = true;
        _errorMessage = "Sim Racing count is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isSimRacingCountError = false;
      }

      if (simRacingAmountController.text.isEmpty ||
          double.tryParse(simRacingAmountController.text) == null) {
        _isSimRacingAmountError = true;
        _errorMessage = "Sim Racing amount is invalid";
        isValid = false;
        notifyListeners();
        return isValid;
      } else {
        _isSimRacingAmountError = false;
      }
    }

    notifyListeners();
    return isValid;
  }

  Future<void> submitInventoryInfo() async {
    if (_isLoading) {
      return;
    }

    if (!validateSubmitInventoryInfo()) {
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
      await firestoreService.createConsoleRecord(_consoles, cafeDetails.id);

      await firestoreService.updateCafeRecord(cafeDetails.copyWith(
          registerStep: 2, tsUpdated: DateTime.now().toIso8601String()));

      _isStepTwoSuccess = true;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Something went wrong.";
      _isLoading = false;
      _showErrorSnackbar = true;
      notifyListeners();
    }

    _isLoading = false;
    notifyListeners();
  }

  bool validateSubmitFinal() {
    bool isValid = true;

    if (googleMapsController.text.isEmpty) {
      _isGoogleMapsError = true;
      _errorMessage = "Google Maps link cannot be empty";
      isValid = false;
      notifyListeners();
      return isValid;
    } else {
      _isGoogleMapsError = false;
    }

    if (topGameController.text.isEmpty) {
      _isTopGameError = true;
      _errorMessage = "Top games cannot be empty";
      isValid = false;
      notifyListeners();
      return isValid;
    } else {
      _isTopGameError = false;
    }

    if (!_isAlwaysOpen) {
      if (_openTime.isEmpty) {
        isValid = false;
        _isOpeningTimeError = true;
        _errorMessage = "Please Select Opening time";
        notifyListeners();
        return isValid;
      } else {
        _isOpeningTimeError = false;
      }
      if (_closeTime.isEmpty) {
        isValid = false;
        _isClosingTimeError = true;
        _errorMessage = "Please Select Closing time";
        notifyListeners();
        return isValid;
      } else {
        _isClosingTimeError = false;
      }
    }

    notifyListeners();
    return isValid;
  }

  Future<void> submitFinal() async {
    if (_isLoading) {
      return;
    }

    if (!validateSubmitFinal()) {
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      Cafe updatedCafeDetails = cafeDetails.copyWith(
        tsUpdated: DateTime.now().toIso8601String().toString(),
        openTimeUTC: _openTime,
        closeTimeUTC: _closeTime,
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
      _isStepThreeSuccess = true;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Something went wrong.";
      _isLoading = false;
      _showErrorSnackbar = true;
      notifyListeners();
    }
  }

  void resetErrors() {
    _isCafeNameError = false;
    _isOwnerNameError = false;
    _isOwnerPhoneError = false;
    _isPcCountError = false;
    _isPcAmountError = false;
    _isPsCountError = false;
    _isPsAmountError = false;
    _isVrCountError = false;
    _isVrAmountError = false;
    _isXboxCountError = false;
    _isXboxAmountError = false;
    _isStreamingCountError = false;
    _isStreamingAmountError = false;
    _isSimRacingCountError = false;
    _isSimRacingAmountError = false;
    _isTopGameError = false;
    _isGoogleMapsError = false;
    _errorMessage = "";
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
