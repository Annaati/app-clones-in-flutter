// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:instagram_clone/globle_variables.dart';
import 'package:instagram_clone/utilities/colors.dart';

class MobileCsreenLayout extends StatefulWidget {
  const MobileCsreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileCsreenLayout> createState() => _MobileCsreenLayoutState();
}

class _MobileCsreenLayoutState extends State<MobileCsreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void NavTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //model.Users users = Provider.of<UsersProvider>(context).getUsers;
    return Scaffold(
      body: PageView(
        children: HomeScreenNavBar,
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        // child: Text('Hey👋  Welcome to Mobile Home Screen Layout'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: _page == 1 ? primaryColor : secondaryColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined,
                color: _page == 2 ? primaryColor : secondaryColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
                color: _page == 3 ? primaryColor : secondaryColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _page == 4 ? primaryColor : secondaryColor),
            label: '',
          ),
        ],
        onTap: NavTapped,
      ),
    );
  }
}
