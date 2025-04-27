import 'package:deca_app_yolo/product.dart';
import 'package:deca_app_yolo/widgets/productCard.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}



class _ShoppingScreenState extends State<ShoppingScreen> {
  int selectedFilter = 0;

  Widget buildFilterCatagory(int index, String name){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedFilter = index;
        });
      },
      child: Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedFilter == index ? Colors.red : Colors.red.shade300,
          borderRadius: BorderRadius.circular(9)
        ),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget buildTitle(String text){
    return Padding(
      padding: EdgeInsets.only(left:16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Column buildAll(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle("Curated For You"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 273,
            child: ListView( 
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[0]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[1]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[2]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[3]),
                ),
              ],
            ),
          ),
        ),
        buildTitle("Best Selling"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 273,
            child: ListView( 
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[4]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[5]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[6]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[7]),
                ),
              ],
            ),
          ),
        ),
  
        buildTitle("On Sale"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 273,
            child: ListView( 
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[8]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[9]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[10]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(product: Product.allProducts[11]),
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }

   Column buildFiltered(){
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle("a"),
        buildTitle("Best Selling"),
        buildTitle("On Sale"),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
          children: [
            (selectedFilter == 0) ? buildAll() : buildFiltered()  
          ]
      ),
    );
  }
}