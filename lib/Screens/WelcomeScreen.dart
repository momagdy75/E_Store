import 'package:awazon/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/Product.dart';

class WelcomeScreen extends StatefulWidget {


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: Text(
              'Welcome',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Please Login or Signup to continue using the app',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Image(
              image: AssetImage('assets/images/welcome.png'),
              height: 250,
              width: 350,
            ),
          ),
          Center(
            child: Text(
              'Enter via Google or Facebook',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      FontAwesomeIcons.facebookSquare,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF475993)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              'or login with Email',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }), (route) => false);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account ?'),
              TextButton(onPressed: () {}, child: Text("Create account"))
            ],
          )
        ],
      ),
    ));
  }
}
