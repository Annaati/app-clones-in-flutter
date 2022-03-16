
import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/screens.dart';
import 'package:zoom_clone/utils/colors.dart';

void main() => runApp(const ZoomClone()); 

class ZoomClone extends StatelessWidget {
  const ZoomClone({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor, 
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
      },
      home: const LoginScreen(),
    );
  }
}




//Text('Flutter-Firebase Zoom Clone Comming Soon inshaAllah...', style: TextStyle(color: Colors.white),),