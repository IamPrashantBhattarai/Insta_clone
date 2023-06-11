import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  //We have to create the instance of this class(Firebase Auth)
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign up the user
  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error has been occured";
    try {
      //update the value of res
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //register user using firebase
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
