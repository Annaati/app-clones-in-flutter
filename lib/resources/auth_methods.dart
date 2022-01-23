// ignore_for_file: avoid_print, non_constant_identifier_names, library_prefixes

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/models.dart' as usersModel;
import 'package:instagram_clone/resources/resources.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<usersModel.Users> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return usersModel.Users.fromsnap(snap);
  }

  //Sing Up Function
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

        usersModel.Users users = usersModel.Users(
          uid: uCred.user!.uid,
          userName: userName,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          profilePicUrl: profilePicUrl,
        );

        await _firestore
            .collection('users')
            .doc(uCred.user!.uid)
            .set(users.toJson());
        res = 'Success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //User Login
  Future<String> Login({
    required String email,
    required String password,
  }) async {
    String res = 'Some Error Occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Enter All Credentials';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
