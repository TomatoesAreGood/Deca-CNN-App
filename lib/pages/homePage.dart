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
  int currentIndex = 1;

  List<Widget> screens = [
    ShoppingScreen(),
    ShoppingScreen(),
    ShoppingScreen(),
    FavoritedScreen(),
    CheckoutScreen()
  ];

  @override
  void initState() {
    super.initState();
  }

  AppBar buildAppBar(){
    if (currentIndex != 1){
      return AppBar(
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
      );
    }
    return AppBar(
        titleSpacing: 0,
        leading: Padding(padding: EdgeInsets.all(12)),
        leadingWidth: 12,
        iconTheme: IconThemeData(color: Colors.white),
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                constraints: BoxConstraints(minHeight:40, maxHeight: 40),
                hintText: "Search with AI",
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                shape:  WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) 
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search, color: Colors.grey,),
              );
            }, 
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              });
            }
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 131, 37, 30),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen())
              );
            },
            icon: Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            )
          ),IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen())
              );
            },
            icon: Icon(
              Icons.shopping_cart_checkout_outlined,
              color: Colors.white,
            )
          ),
        ],
      );
  }

   BottomNavigationBarItem _buildNavItem(String label, IconData icon, int index) {
    if(index == 2){
      return BottomNavigationBarItem(
        icon: Column(
          children: [
            Icon(icon, color: Colors.red, size: 28,),
            Text(
              label,
              style: TextStyle(
                color: Colors.red,
                fontWeight:FontWeight.w900,
                fontSize: 17
              ),
            ),
          ],
        ),
        label: '',
      );
    }
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: currentIndex == index ? Colors.red : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? Colors.red : Colors.grey,
              fontWeight:FontWeight.normal,
            ),
          ),
          if (currentIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: 20,
              color: Colors.red,
            )
          else
            const SizedBox(height: 7), // to keep spacing consistent
        ],
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: (currentIndex != 1)?Container():Drawer(backgroundColor: Colors.white,),
      appBar: buildAppBar(),
      body: screens[currentIndex],
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavItem('Home', Icons.home, 0),
          _buildNavItem('Shop', Icons.shopping_bag, 1),
          _buildNavItem('Camera', Icons.camera_alt, 2),
          _buildNavItem('Favorited', Icons.favorite, 3),
          _buildNavItem('Account', Icons.person, 4),
        ],
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex = value;
            if(value == 2){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CameraStream()));
            }
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 8,
      )
    );
  }
}