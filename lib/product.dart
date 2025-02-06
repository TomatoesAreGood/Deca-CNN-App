import 'dart:convert';

import 'package:flutter/services.dart';

class Product {
  static late List<Product> allProducts;

  final int id;
  final double price;
  final int category;
  final bool isStaples;

  final String name;
  final String desc;
  final String website;

  const Product({required this.id, required this.name, required this.category, required this.desc, required this.price, required this.website, required this.isStaples});

  static retrieveProductInfo() async{
    String jsonString = await rootBundle.loadString('assets/productInfo.json');
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    List products = json["products"];
    allProducts = [];
    
    for (var i = 0; i < products.length; i++){
      allProducts.add(
        Product(
          id: products[i]['id'], 
          name: products[i]['name'],
          category: products[i]['category'],
          desc: products[i]['desc'],
          price: products[i]['price'],
          website: products[i]['website'],
          isStaples: products[i]['isStaples']
        )
      );
    }
  }

  static Product getProduct(int productID){
    for (int i = 0; i < allProducts.length; i++){
      if(allProducts[i].id == productID){
        return allProducts[i];
      }
    }
    return Product(
      id: 000, 
      name: 'null',
      category: -1,
      desc: 'null',
      price: -1,
      website: 'null',
      isStaples: false
    );
  }
}