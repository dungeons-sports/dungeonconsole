import 'package:dungeonconsole/main.dart';
import 'package:dungeonconsole/models/modelUser/model.user.dart';
import 'package:dungeonconsole/services/service.authentication.dart';
import 'package:flutter/material.dart';

class VMLogin extends ChangeNotifier {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get isLoading => _isLoading;

  Future<bool?> loginWithEmail() async {
    final AuthenticationService authService =
        locator.get<AuthenticationService>();
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      print('Email and password must not be empty');
      return null;
    }

    try {
      AppUser? appUser = await authService.loginWithEmailPassword(email, password);
      if(appUser != null){
        return appUser.isCafe;
      }

      return false;
    } catch (e) {
      // Handle login error
      print('Login failed: $e');
      return null;
    }
  }

  Future<bool?> signUpWithGoogle(bool isPartner) async {
    if (_isLoading) {
      return null;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final authService = locator.get<AuthenticationService>();
      AppUser? appUser = await authService.signUpWithGoogle(isPartner);

      if(appUser != null){
        return appUser.isCafe;
      }

      _isLoading = false;
      notifyListeners();

      return false;
    } catch (e) {
      print(e);
      _isLoading = false;
      notifyListeners();

      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
