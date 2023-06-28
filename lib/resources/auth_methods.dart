import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  //We have to create the instance of this class(Firebase Auth)
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Sign up the user
  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error has been occured.";
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
        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePictures', file, false);
        //add user to our database

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          //followers and following will be the list of uids for a account
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });

        res = "Success";
      }
      //Like wise we can give our custom errormessage using firebase.
      // } on FirebaseAuthException catch (err) {
      //   if (err.code == 'invalid-email') {
      //     res = "The email is badly formatted.";
      //   } else if (err.code == 'weak-password') {
      //     res = "Password should be at least 6 characters.";
      //   }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
