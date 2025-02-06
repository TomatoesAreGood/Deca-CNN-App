import 'package:deca_app_yolo/pages/productPage.dart';
import 'package:deca_app_yolo/product.dart';
import 'package:flutter/material.dart';

class ItemListTile extends StatefulWidget {
  final int productID;

  const ItemListTile({super.key, required this.productID});

  @override
  State<ItemListTile> createState() => _ItemListTileState();
}

class _ItemListTileState extends State<ItemListTile> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: const Color.fromARGB(255, 163, 163, 163),
        ),
        Container(
          color: Colors.grey[50],
          child: Material(
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProductPage(productId: widget.productID)));
              },
              minTileHeight: 80,
              leading: Image.asset('assets/detected_images/${widget.productID}.png'),
              title: Text(
                Product.getProduct(widget.productID).name, 
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text('Product ID: ${widget.productID}'),
            ),
          ),
        ),
      ],
    );
  }
}