
import 'package:awazon/Screens/CartScreen.dart';
import 'package:awazon/Screens/Home.dart';
import 'package:awazon/Screens/ItemScreen.dart';
import 'package:awazon/Screens/WelcomeScreen.dart';

import 'package:flutter/material.dart';
void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,

      home:HomeScreen(),
    );
  }
}

