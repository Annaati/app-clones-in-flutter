// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  final String description;
  final String uid;
  final String userName;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profilePic;
  final likes;

  const Posts({
    required this.description,
    required this.uid,
    required this.userName,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profilePic,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'userName': userName,
        'postId': postId,
        'datePublished': datePublished,
        'postUrl': postUrl,
        'profilePicUrl': profilePic,
        'likes': likes,
      };

  static Posts fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Posts(
      description: snapshot['description'],
      uid: snapshot['uid'],
      userName: snapshot['userName'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profilePic: snapshot['profilePic'],
      likes: snapshot['likes'],
    );
  }
}
