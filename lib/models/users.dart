import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String uid;
  final String userName;
  final String email;
  final String bio;
  final List followers;
  final List following;
  final String profilePicUrl;

  const Users({
    required this.uid,
    required this.userName,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.profilePicUrl,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'userName': userName,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'profilePicUrl': profilePicUrl,
      };

  static Users fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Users(
      uid: snapshot['uid'],
      userName: snapshot['userName'],
      email: snapshot['email'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      profilePicUrl: snapshot['profilePicUrl'],
    );
  }
}
