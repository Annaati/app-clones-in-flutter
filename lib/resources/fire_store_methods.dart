import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/resources/resources.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  Future<String> UploadToFeed(
    String descr,
    String uid,
    String userName,
    String profilePic,
    Uint8List file,
  ) async {
    String res = 'Some error occured';
    try {
      String photoUrl = await StorageMethods()
          .UploadImageToFirebaseStorage('posts', file, true);

      String postId = const Uuid().v1();

      Posts posts = Posts(
        description: descr,
        uid: uid,
        userName: userName,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profilePic: profilePic,
        likes: [],
      );

      _firestore.collection('posts').doc(postId).set(posts.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}