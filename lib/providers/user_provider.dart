import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  //Creating the global variable
  //Make sure to make this user a private field
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getUser => const User(
        uid: '',
        followers: '',
        email: '',
        bio: '',
        photoUrl: '',
        username: '',
        following: '',
      );

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
