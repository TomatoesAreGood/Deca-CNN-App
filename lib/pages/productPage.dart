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
      body: Center(
        
        child: Text("among us"),
      ),
    );
  }
}