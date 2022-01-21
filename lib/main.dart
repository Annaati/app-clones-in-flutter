// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/screens.dart';
//import 'responsive/responsive.dart';
import 'utilities/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyD1W9Lw0mFeSrQyPdawRWLY9oJ4PYNLbiI',
        appId: '1:801878427370:web:64237afb34dd83a251f993',
        messagingSenderId: '801878427370',
        projectId: 'instagram-clone-8c4eb',
        storageBucket: 'instagram-clone-8c4eb.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const InstagramClone());
}

class InstagramClone extends StatelessWidget {
  const InstagramClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: LoginScreen(),
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileCsreenLayout(),
      // ),
    );
  }
}
