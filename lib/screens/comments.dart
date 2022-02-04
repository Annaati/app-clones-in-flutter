// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/resources/fire_store_methods.dart';
import 'package:instagram_clone/utilities/colors.dart';
import 'package:instagram_clone/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({Key? key, required this.snap}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<UsersProvider>(context).getUsers;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: false,
        backgroundColor: mobileBackgroundColor,
      ),
      body: CommentsCard(),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(users.profilePicUrl),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8.0),
                  child: TextField(
                    controller: _commentsController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ${users.userName}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: ()  async{
                  await FireStoreMethods().PostComment(widget.snap['postId'], _commentsController.text, users.uid, users.userName, users.profilePicUrl);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
