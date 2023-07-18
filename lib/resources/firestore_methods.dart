import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class FirebstoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
  ) async {
    String res = "Some error occures";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
    } catch (e) {}
  }
}
