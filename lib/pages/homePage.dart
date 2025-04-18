import 'package:deca_app_yolo/pages/cameraStream.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "Staples CORE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 131, 37, 30),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context) => CameraStream())
              );
            },
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