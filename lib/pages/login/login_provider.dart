import 'package:flutter/material.dart';
import 'package:real_estate_poc_app/models/user_model.dart';

import 'package:real_estate_poc_app/services/firebase_service.dart';

class LoginProvider extends ChangeNotifier {
  User? loggedInUser;

  final firebaseService = FirebaseService();

  Future<void> initialize() async {}

  Future<bool> loginUser(
      {required String email, required String password}) async {
    final credential = await firebaseService.signInUser(
        emailAddress: email, password: password);

    if (credential?.user != null) {
      loggedInUser = User.fromFbUser(credential!.user!);
      return true;
    }

    return false;
  }

  Future<void> signInWithGoogle() async {
    firebaseService.signInWithGoogle();
  }
}
