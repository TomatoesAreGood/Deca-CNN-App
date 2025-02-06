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
    return const Placeholder();
  }
}