import 'dart:convert';

import 'package:flutter/services.dart';

class Product {
  static List<Product> allProducts = [
    Product(
      id: 1,
      name: "BIC Ultra Round Stic Grip Ballpoint Pen",
      desc: "A reliable ballpoint pen with a comfortable grip for smooth, everyday writing.",
      price: 3.29,
      website: "https://www.staples.ca/products/382242-en-bic-ultra-round-stic-grip-ballpoint-stick-pens-12mm-blue-12-pack?listId=search",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 2,
      name: "BIC Round Stic Ballpoint Pen M",
      desc: "A classic medium-point ballpoint pen offering consistent ink flow and a lightweight design.",
      price: 11.49,
      website: "https://www.staples.ca/products/442901-en-bic-round-stic-ballpoint-pens-medium-tip-10mm-black-60-pack",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 3,
      name: "BIC Cristal Stic Ballpoint Pen M",
      desc: "A transparent barrel pen with a medium point for crisp and reliable writing.",
      price: 2.79,
      website: "https://www.staples.ca/products/10252-en-bic-cristal-ballpoint-stick-pens-10mm-blue-12-pack?listId=search",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 4,
      name: "BIC Mechanical Pencil 0.7mm #2",
      desc: "A sturdy mechanical pencil with #2 lead and a 0.7mm tip for precise writing and sketching.",
      price: 9.49,
      website: "https://www.staples.ca/products/434931-en-bic-extra-comfort-2-hb-mechanical-pencils-07mm-12-pack",
      category: 4,
      isStaples: false
    ),
    Product(
      id: 5,
      name: "Paper Mate Intro Highlighter",
      desc: "A bright, smooth highlighter designed to emphasize important text without smudging.",
      price: 2.65,
      website: "https://www.staples.ca/products/35472-en-sharpie-chisel-tip-pocket-style-highlighters-assorted-colours-4-pack?listId=search",
      category: 3,
      isStaples: false
    ),
    Product(
      id: 6,
      name: "Staples Hype! Pen-Style Highlighter",
      desc: "A vibrant pen-style highlighter with a chisel tip for versatile highlighting and underlining.",
      price: 4.69,
      website: "https://www.staples.ca/products/412775-en-staples-hype-chisel-tip-pen-style-highlighters-yellow-6-pack",
      category: 3,
      isStaples: true
    ),
    Product(
      id: 7,
      name: "Black Sharpie Fine Tip Permanent Marker",
      desc: "A versatile permanent marker with a fine tip for bold and detailed marks on various surfaces.",
      price: 14.99,
      website: "https://www.staples.ca/products/11520-en-sharpie-permanent-markers-fine-tip-black-12-pack",
      category: 5,
      isStaples: true
    ),
    Product(
      id: 8,
      name: "Pentel Rolly C3 BallPoint Pen",
      desc: "A sleek ballpoint pen with smooth ink flow and a comfortable grip for everyday use.",
      price: 6.89,
      website: "https://www.staples.ca/products/2675867-en-bic-4-colour-3-1-pen-and-mechanical-pencil",
      category: 1,
      isStaples: false
    ),
    Product(
      id: 9,
      name: "Casemate Hb #2 Yellow Wood Pencil",
      desc: "A traditional yellow wood pencil with strong HB #2 lead for clear, consistent writing.",
      price: 8.99,
      website: "https://www.staples.ca/products/603283-en-staples-wood-cased-pencils-2-hb-72-pack ",
      category: 4,
      isStaples: false
    ),
    Product(
      id: 10,
      name: "Paper Mate Ballpoint Pen M",
      desc: "A dependable medium-point ballpoint pen with smooth ink and a comfortable grip.",
      price: 2.69,
      website: "https://www.staples.ca/products/10501-en-paper-mate-ballpoint-stick-pens-blue-medium-12-pack?listId=search",
      category: 1,
      isStaples: false
    )
  ];

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
    return "";
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