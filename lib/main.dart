// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/providers.dart';
import 'package:instagram_clone/responsive/responsive.dart';
import 'package:instagram_clone/screens/screens.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (conntext, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileCsreenLayout(),
                );
              } else if (snapshot.hasError) {
                return (showSnackBar(context, '${snapshot.error}'));
              }
              //snapshot has no data
            }
            //snapshot is not connected
            if (snapshot.connectionState == ConnectionState.waiting) {
              const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return LoginScreen();
          },
        ),
        //LoginScreen(),
        // home: const ResponsiveLayout(
        //   webScreenLayout: WebScreenLayout(),
        //   mobileScreenLayout: MobileCsreenLayout(),
        // ),
      ),
    );
  }
}
