import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/models/models.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UsersProvider with ChangeNotifier {
  Users? _user;
  final AuthMethods _authMethods = AuthMethods();

  Users get getUsers => _user!;

  Future<void> refreshUser() async {
    Users user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
