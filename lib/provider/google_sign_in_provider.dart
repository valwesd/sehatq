//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  /*GoogleSignInAccount? googleAccount;

  login() async {
    this.googleAccount = await _googleSignIn.signIn();
    notifyListeners();
  }

  logout() async {
    this.googleAccount = await _googleSignIn.disconnect();
    notifyListeners();
  }*/

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout() async {
    try {
      await _googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }

    notifyListeners();
  }
}
