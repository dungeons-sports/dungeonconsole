import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VMLogin extends ChangeNotifier {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool get isEmailValid => _isEmailValid;
  bool get isPasswordValid => _isPasswordValid;
  bool _onLoginError = false;
  bool get onLoginError => _onLoginError;

  String _emailErrorMessage = "";
  String _passwordErrorMessage = "";
  String _loginErrorMessage = "";
  String get emailErrorMessage => _emailErrorMessage;
  String get passwordErrorMessage => _passwordErrorMessage;
  String get loginErrorMessage => _loginErrorMessage;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isLoading => _isLoading;

  void clearLoginErrorMessage(){
    _emailController.text = "";
    _passwordController.text = "";
    _emailErrorMessage = "";
    _passwordErrorMessage = "";
    _isEmailValid = true;
    _isPasswordValid = true;
    _loginErrorMessage = "";
    _onLoginError = false;
    notifyListeners();
  }

  bool? validate(String email, String password) {
    if (email.isEmpty) {
      _emailErrorMessage = "Cannot be empty";
      _isEmailValid = false;
      notifyListeners();
      return null;
    } else {
      _isEmailValid = true;
      notifyListeners();
    }

    // Validate email format using regex
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      _emailErrorMessage = "Invalid email format";
      _isEmailValid = false;
      notifyListeners();
      return null;
    } else {
      _isEmailValid = true;
      notifyListeners();
    }

    if (password.isEmpty) {
      _passwordErrorMessage = "Cannot be empty";
      _isPasswordValid = false;
      notifyListeners();
      return null;
    } else {
      _isPasswordValid = true;
      notifyListeners();
    }

    return true;
  }

  Future<AppUser?> loginWithEmail() async {
    final AuthenticationService authService =
        locator.get<AuthenticationService>();
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      bool? isValid = validate(email, password);
      if (isValid != null && isValid) {
        AppUser? appUser =
            await authService.loginWithEmailPassword(email, password);
        if (appUser != null) {
          return appUser;
        }

        return null;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      _onLoginError = true;
      _loginErrorMessage = e.message!;
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<AppUser?> signUpWithGoogle() async {
    if (_isLoading) {
      return null;
    }

    try {
      _onLoginError = false;
      _isLoading = true;
      notifyListeners();

      final authService = locator.get<AuthenticationService>();
      AppUser? appUser = await authService.signUpWithGoogle();

      if (appUser != null) {
        return appUser;
      }

      _isLoading = false;
      notifyListeners();

      return null;
    } on FirebaseAuthException catch (e) {
      _onLoginError = true;
      _loginErrorMessage = e.code;
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
