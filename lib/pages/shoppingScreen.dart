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

  Widget buildProductCard(int id, {discount = 0, pickup = 1, stars = 4}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, size: 50),
                ),
                (discount != 0) ?
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$discount% off',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ):
                  Container()
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Hammermill Copy Plus 8.5\" x 11\" Copy...",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: List.generate(5, (index) => const Icon(Icons.star, size: 14, color: Colors.amber)),
            ),
            const SizedBox(height: 4),
            const Text(
              "\$46.99",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            const Text(
              "1-hr pickup\nin Toronto",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );             
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("Curated For You"),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 338,
                child: ListView( 
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildProductCard(0, discount: 40),
                    buildProductCard(1, discount: 26),
                    buildProductCard(2, discount: 30),
                    buildProductCard(3, discount: 18),
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
        ),
      ],
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

}