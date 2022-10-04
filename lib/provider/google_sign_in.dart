import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final gsignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLogin() async {
    try {
      final googleUser = await gsignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future googleLogout() async {
    await gsignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
