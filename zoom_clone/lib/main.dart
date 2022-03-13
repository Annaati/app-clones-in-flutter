
import 'package:flutter/material.dart';

void main() => runApp(const ZoomClone()); 

class ZoomClone extends StatelessWidget {
  const ZoomClone({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: Text('Flutter-Firebase Zoom Clone Comming Soon inshaAllah...', 
      style: TextStyle(
        color: Colors.white,
        fontSize: 14),
      ),
      ),
    );
  }
}


//Text('Flutter-Firebase Zoom Clone Comming Soon inshaAllah...', style: TextStyle(color: Colors.white),),