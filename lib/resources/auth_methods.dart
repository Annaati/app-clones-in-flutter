// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/resources.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Sing Up Function
  // ignore: non_constant_identifier_names
  Future<String> SignUp({
    required String userName,
    required String email,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occored';
    try {
      if (userName.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        //Register User
        UserCredential uCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(uCred.user!.uid);
        String profilePicUrl = await StorageMethods()
            .UploadImageToFirebaseStorage('ProfilePics', file, false);
        //Add User Details to Firebase FireStore
        await _firestore.collection('users').doc(uCred.user!.uid).set({
          'uid': uCred.user!.uid,
          'userName': userName,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'profilePicUrl': profilePicUrl,
        });
        res = 'Success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
