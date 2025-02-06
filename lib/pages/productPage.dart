import 'package:deca_app_yolo/product.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final int productId;

  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height/10,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
               Text(
                  '\$' '${Product.getProduct(widget.productId).price}',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.send), 
                  label: Text("Add to Cart"),
                  style: ButtonStyle(
                  ),
                )
            ],
          ),
        ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 54, 44),
        title:Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(Product.getProduct(widget.productId).name)
              )
            ),
          ]
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,width: 300,
                padding: EdgeInsets.all(5), // Border width
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child:Image.asset('assets/product_images/${widget.productId}.png')                  
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),

          Container( 
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )
            ),
            child: Column(
              children: [ 
                Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 275,
                      child: Text(
                        Product.getProduct(widget.productId).name.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$' '${Product.getProduct(widget.productId).price}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  Product.getProduct(widget.productId).desc,
                  textAlign:  TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}