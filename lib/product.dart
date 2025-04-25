import 'dart:convert';

import 'package:flutter/services.dart';

class Product {
  static List<Product> allProducts = [
    Product(
      id: 1,
      name: "BIC Ultra Round Stic Grip Ballpoint Pen",
      desc: "A reliable ballpoint pen featuring an ultra-comfortable grip that reduces hand fatigue, allowing for smooth and precise writing. Its lightweight design makes it easy to carry around, making it ideal for everyday use at school or work.",
      price: 3.29,
      website: "https://www.staples.ca/products/382242-en-bic-ultra-round-stic-grip-ballpoint-stick-pens-12mm-blue-12-pack?listId=search",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 2,
      name: "BIC Round Stic Ballpoint Pen M",
      desc: "A classic medium-point ballpoint pen offering smooth ink flow and a comfortable design for prolonged writing sessions. Its lightweight build makes it convenient for everyday writing tasks, from taking notes in class to creating detailed lists at work.",
      price: 11.49,
      website: "https://www.staples.ca/products/442901-en-bic-round-stic-ballpoint-pens-medium-tip-10mm-black-60-pack",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 3,
      name: "BIC Cristal Stic Ballpoint Pen M",
      desc: "This pen features a transparent barrel, allowing you to monitor ink levels while writing. The medium point provides crisp, clear lines, making it ideal for everyday writing. It is both reliable and affordable, perfect for school or office environments.",
      price: 2.79,
      website: "https://www.staples.ca/products/10252-en-bic-cristal-ballpoint-stick-pens-10mm-blue-12-pack?listId=search",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 4,
      name: "BIC Mechanical Pencil 0.7mm #2",
      desc: "A sturdy and dependable mechanical pencil equipped with #2 lead, ideal for standardized tests or detailed sketching. The 0.7mm tip allows for precise lines, and its durable design ensures that it can withstand frequent use without breaking easily.",
      price: 9.49,
      website: "https://www.staples.ca/products/434931-en-bic-extra-comfort-2-hb-mechanical-pencils-07mm-12-pack",
      category: 4,
      isStaples: false
    ),
    Product(
      id: 5,
      name: "Paper Mate Intro Highlighter, Pink",
      desc: "This vibrant highlighter is designed for smooth application and consistent color. It easily emphasizes key points in texts without smudging, making it perfect for students or professionals who need to highlight important information in books or documents efficiently.",
      price: 2.65,
      website: "https://www.staples.ca/products/35472-en-sharpie-chisel-tip-pocket-style-highlighters-assorted-colours-4-pack?listId=search",
      category: 3,
      isStaples: false
    ),
    Product(
      id: 6,
      name: "Staples Hype! Pen-Style Highlighter",
      desc: "A vibrant pen-style highlighter featuring a chisel tip for versatile marking, including both highlighting and underlining. Its long-lasting ink ensures vibrant results, while the slim, pen-like design makes it easy to carry around in pockets or pencil cases.",
      price: 4.69,
      website: "https://www.staples.ca/products/412775-en-staples-hype-chisel-tip-pen-style-highlighters-yellow-6-pack",
      category: 3,
      isStaples: true
    ),
    Product(
      id: 7,
      name: "Black Sharpie Fine Tip Permanent Marker",
      desc: "This permanent marker offers a fine tip that allows for detailed, precise markings on various surfaces. Its bold black ink is water-resistant and quick-drying, making it a reliable tool for creating permanent labels, art projects, or professional presentations.",
      price: 14.99,
      website: "https://www.staples.ca/products/11520-en-sharpie-permanent-markers-fine-tip-black-12-pack",
      category: 5,
      isStaples: true
    ),
    Product(
      id: 8,
      name: "Pentel Rolly C3 BallPoint Pen",
      desc: "This sleek and stylish ballpoint pen provides a smooth and effortless writing experience. Its ergonomic grip ensures comfort during long writing sessions, while its high-quality ink delivers consistent and clear lines, making it a reliable everyday writing tool.",
      price: 6.89,
      website: "https://www.staples.ca/products/2675867-en-bic-4-colour-3-1-pen-and-mechanical-pencil",
      category: 1,
      isStaples: false
    ),
    Product(
      id: 9,
      name: "Casemate Hb #2 Yellow Wood Pencil",
      desc: "A traditional yellow wood pencil with strong HB #2 lead, perfect for clear, consistent writing or drawing. Its durable wood casing ensures longevity, while the smooth lead provides excellent coverage, making it an essential tool for school or office tasks.",
      price: 8.99,
      website: "https://www.staples.ca/products/603283-en-staples-wood-cased-pencils-2-hb-72-pack ",
      category: 4,
      isStaples: false
    ),
    Product(
      id: 10,
      name: "Paper Mate Ballpoint Pen M",
      desc: "This dependable medium-point ballpoint pen offers a smooth ink flow and comfortable grip, making it suitable for everyday use. Whether you're writing notes at school or drafting documents at work, it ensures neat, consistent, and reliable writing results.",
      price: 2.69,
      website: "https://www.staples.ca/products/10501-en-paper-mate-ballpoint-stick-pens-blue-medium-12-pack?listId=search",
      category: 1,
      isStaples: false
    ),
    Product(
      id: 11,
      name: "BIC Round Stic Grip Ballpoint Pen Red",
      desc: "With a comfortable grip and smooth ink delivery, this red ballpoint pen is perfect for everyday tasks. Its lightweight design and vivid ink make it ideal for annotating documents or adding colorful notes.",
      price: 3.29,
      website: "https://www.staples.ca/products/395895-en-bic-ultra-round-stic-grip-ballpoint-pens-12mm-red-12-pack",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 12,
      name: "Paper Mate Comfortmate Ultra Ballpoint Pens 1.0mm - Blue",
      desc: "Enjoy effortless writing with this ultra-comfortable ballpoint pen. The soft grip and precise 1.0mm tip reduce hand fatigue, making it a reliable choice for long writing sessions in class or at the office.",
      price: 14.49,
      website: "https://www.staples.ca/products/46024-en-paper-mate-comfortmate-ultra-ballpoint-pens-retractable-10mm-black-12-pack",
      category: 1,
      isStaples: false
    ),
    Product(
      id: 13,
      name: "BIC Soft Feel Stick Pen, Medium Point, Black",
      desc: "Designed for comfort and control, this pen offers a soft-touch barrel and dependable ink flow. The black ink writes smoothly and dries quickly, making it great for daily note-taking and quick signatures.",
      price: 17.99,
      website: "https://www.staples.com/bic-soft-feel-retractable-ballpoint-pen-medium-point-1-0mm-assorted-ink-36-pack-scsm361-ast/product_219241",
      category: 1,
      isStaples: false
    ),
    Product(
      id: 14,
      name: "General Supply Goods + Co Recycled Ball Pen",
      desc: "Eco-conscious and efficient, this recycled ballpoint pen set blends sustainable materials with quality writing performance. Each pen offers smooth ink and a comfortable grip—perfect for environmentally aware users who don’t want to compromise quality.",
      price: 5.98,
      website: "https://www.staples.ca/products/3090852-en-general-supply-goods-co-recycled-ball-pen-set-wheat-straw-material-4-pack",
      category: 1,
      isStaples: true
    ),
    Product(
      id: 15,
      name: "Paper Mate Intro Highlighter, Yellow",
      desc: "Brighten up your reading material with this vivid yellow highlighter. Its chisel tip allows for both broad highlighting and fine underlining, while the quick-drying ink prevents smudges and ensures clean, crisp text emphasis every time.",
      price: 2.65,
      website: "https://www.staples.ca/products/35472-en-sharpie-chisel-tip-pocket-style-highlighters-assorted-colours-4-pack?listId=search",
      category: 3,
      isStaples: false
    ),
    Product(
      id: 16,
      name: "Staples HB/2 Graphite Pencil",
      desc: "Crafted for everyday use, this HB/2 pencil delivers consistent lines with a strong, break-resistant core. Ideal for writing, drawing, or sketching, it offers a comfortable grip and clean erasing for precise work.",
      price: 2.79,
      website: "https://www.staples.ca/products/635236-en-staples-hb2-graphite-pencils-12-pack",
      category: 4,
      isStaples: true
    ),
    Product(
      id: 17,
      name: "BIC Wite-Out EZcorrect Correction Tape",
      desc: "Fix mistakes fast with this easy-glide correction tape. It applies dry, allowing for instant rewriting, and the ergonomic design ensures accuracy and control—perfect for students, professionals, and anyone who values clean edits.",
      price: 12.49,
      website: "https://www.staples.ca/products/682380-en-bic-wite-out-ezcorrect-correction-tape-4-pack",
      category: 0,
      isStaples: true
    ),
    Product(
      id: 18,
      name: "BIC Round Stic Grip Ballpoint Pen Red",
      desc: "This red ink ballpoint pen combines everyday reliability with a lightweight feel and cushioned grip. Ideal for marking corrections or adding flair to notes, it's a must-have in your writing supply kit.",
      price: 3.29,
      website: "https://www.staples.ca/products/395895-en-bic-ultra-round-stic-grip-ballpoint-pens-12mm-red-12-pack",
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