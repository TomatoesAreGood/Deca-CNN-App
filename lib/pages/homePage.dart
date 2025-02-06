import 'package:deca_app_yolo/pages/checkoutScreen.dart';
import 'package:deca_app_yolo/pages/favoritedScreen.dart';
import 'package:deca_app_yolo/pages/shoppingScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> screens = [
    ShoppingScreen(),
    FavoritedScreen(),
    CheckoutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Staples CORE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 131, 37, 30),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            )
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorited",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart),
          ),
        ]
      ),
    );
  }
}