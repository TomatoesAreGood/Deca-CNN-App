import 'dart:math';

import 'package:deca_app_yolo/pages/productPage.dart';
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

  Widget buildTitle(String text, {seeAll = true}){
    if(seeAll){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left:16),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),        
            Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              "See all",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      );
    }
    return Padding(
      padding: EdgeInsets.only(left:16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  List<Widget> buildRatings(dynamic stars, {intReview=0}){
    String str = intReview.toString();
    String review = str;

    if(stars == 0){
      stars = Random().nextDouble()*2+3;
    }

    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';

    List<Widget> list = [];
    if(review == '0'){
      review = '${Random().nextInt(20000) + 100}';
    }
    for (int i = 0; i < stars.floor(); i++){
      list.add(const Icon(Icons.star, size: 14, color: Colors.amber));
    }
    if (stars.round() > stars.floor()){
      list.add(const Icon(Icons.star_half, size: 14, color: Colors.amber));
    }
    list.add(
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          review.replaceAllMapped(reg, mathFunc),
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w900,
            fontSize: 13
          ),
        ),
      )
    );
    return list;
  }

  Widget buildProductCard(int id, {discount = 0, pickup = 1, stars = 0}){
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(productId: id,)));},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 150,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/product_images/${id}.png'),
                  ),
                  (discount != 0) ?
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        height: 28,
                        width: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(209,156,187, 1),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '$discount% off',
                            style: TextStyle(color: Color.fromRGBO(98, 43, 77, 1), fontSize: 10, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ):
                    Container()
                ],
              ),
              const SizedBox(height: 8),
              Text(
                Product.getProduct(id).name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                children: buildRatings(stars)       
              ),
              Text(
                '\$${Product.getProduct(id).price}',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.5),
              ),
              const SizedBox(height: 6),
              Text(
                '$pickup-hr pickup\nin Orlando',
                style: TextStyle(fontSize: 12),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade400),
                    ),
                    child: const Text("Add"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );             
  }

  Widget buildLargeProductCart(int id, {discount = 0, pickup = 1, stars = 0}){
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(productId: id)));},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 349,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: Image.asset('assets/product_images/${id}.png'),
                      ),
                      (discount != 0) ?
                        Positioned(
                          top: 4,
                          left: 4,
                          child: Container(
                            height: 28,
                            width: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(209,156,187, 1),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '$discount% off',
                                style: TextStyle(color: Color.fromRGBO(98, 43, 77, 1), fontSize: 10, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ):
                        Container()
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Product.getProduct(id).name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item ID: ${id}', style: TextStyle(fontSize: 12),),
                        Text('Model: TR62091', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: buildRatings(stars)       
                    ),
                    Text(
                      '\$${Product.getProduct(id).price}',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.5),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "1-hr pickup\nin Orlando",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
             
            ],
          ),
        ),
      ),
    );             
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("CURATED FOR YOU"),  
            SizedBox(
              height: 355,
              child: ListView( 
                scrollDirection: Axis.horizontal,
                children: [
                  Container(width: 8,),
                  buildProductCard(1, discount: 26, stars: 4.5),
                  buildProductCard(2, discount: 30),
                  buildProductCard(3, discount: 18, stars: 5),
                ],
              ),
            ),
            buildTitle("PURCHASE AGAIN", seeAll: false),
            SizedBox(
              height: 200,
              child: ListView( 
                scrollDirection: Axis.horizontal,
                children: [
                  Container(width: 8),
                  buildLargeProductCart(10)
                ],
              ),
            ),

            buildTitle("BEST SELLING"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 355,
                child: ListView( 
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildProductCard(4),
                    buildProductCard(5),
                    buildProductCard(6),
                  ]
                ),
              ),
            ),
          
            buildTitle("ON SALE"),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 355,
                child: ListView( 
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildProductCard(7, discount: 60),
                    buildProductCard(8, discount: 66),
                    buildProductCard(9, discount: 55),
                  ]
                ),
              ),
            ),
          ]
        ),
      ],
    );
  }

}