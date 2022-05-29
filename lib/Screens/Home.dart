import 'package:awazon/Screens/ItemScreen.dart';
import 'package:awazon/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static bool cartisEmpty = true;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Text("App title"),
        centerTitle: true,
        backgroundColor: Color(0xff333742),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),

        ],
      ),
      body: Container(
        color: Color(0xff333742),
        child: SafeArea(
          child: Column(
            children: [

              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.855,
                      mainAxisSpacing: 15),
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemScreen(products[index])));

                      });

                      },
                      child: ProductBox(
                          product: products[index],
                      ),
                    );
                  },
                  itemCount: products.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
