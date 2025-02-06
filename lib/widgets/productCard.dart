import 'package:deca_app_yolo/pages/productPage.dart';
import 'package:deca_app_yolo/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(productId: widget.product.id,)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.favorite_border_outlined, color: Colors.red,)
              ],
            ),
            Container(
              padding: EdgeInsets.all(5), // Border width
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(65), // Image radius
                  child:  Image.asset('assets/product_images/${widget.product.id}.png'),
                ),
              ),
            ),
            Container(
              height: 3,
            ),
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 8,
            ),
            Text(
              '\$' '${widget.product.price}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}