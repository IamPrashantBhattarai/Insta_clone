import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/models/user.dart';

class UserProvider with ChangeNotifier {
  //Creating the global variable
  //Make sure to make this user a private field
  User? _user;
  User get getUser => _user!;

  Future<void> refreshUser() async {}
}
