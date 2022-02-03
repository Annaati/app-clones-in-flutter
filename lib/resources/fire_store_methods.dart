// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/resources/resources.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


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

  // Like Post
  Future<void> likePost(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //Store Comment
  Future<void> PostComment(String postId, String commentText, String uid,
      String userName, String profilePic) async {
    try {
      if (commentText.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'profilePic': profilePic,
          'uid': uid,
          'userName': userName,
          'commentId': commentId,
          'commentText': commentText,
          'datePublished': DateTime.now(),
        });
      } else {
        print('No comment to post');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
