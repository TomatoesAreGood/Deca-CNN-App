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
      padding: EdgeInsets.only(left:8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSearchBar(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          hintText: "Search",
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }

  Column buildAll(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTitle("Trending"),
        Container( 
          height: 12,
        ),
        GridView.builder(
          padding: const EdgeInsets.only(left:6.5, right: 6.5),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100/140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            
          ),
          itemCount: 4,
          itemBuilder:(context, index) {
            return ProductCard(product: Product.allProducts[index]);
          },
        ),
        Container(
          height: 12,
        ),
        buildTitle("Best Selling"),
        Container(
          height: 12,
        ),
        GridView.count(
          padding: const EdgeInsets.only(left:6.5, right: 6.5),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (100/140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            ProductCard(product: Product.allProducts[4]),
            ProductCard(product: Product.allProducts[5]),
            ProductCard(product: Product.allProducts[6]),
            ProductCard(product: Product.allProducts[7]),
          ]
        ),
        Container(
          height: 12,
        ),
  
        buildTitle("On Sale"),
        Container(
          height: 12,
        ),
         GridView.count(
          padding: const EdgeInsets.only(left:6.5, right: 6.5),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (100/140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            ProductCard(product: Product.allProducts[8]),
            ProductCard(product: Product.allProducts[9]),
            ProductCard(product: Product.allProducts[3]),
            ProductCard(product: Product.allProducts[1]),
          ]
        ),
      ]
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

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Container(
            height: 15,
          ),
          buildSearchBar(),
          Container(
            height: 15,
          ),
          buildTitle("Catagories"),
          
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(left: 8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildFilterCatagory(0, "All"),
                      buildFilterCatagory(1, "Pens"),
                      buildFilterCatagory(2, "Tape"),
                      buildFilterCatagory(3, "Highlighters"),
                      buildFilterCatagory(4, "Pencils"),
                      buildFilterCatagory(5, "Markers"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 12,
          ),
      
          (selectedFilter == 0) ? buildAll() : buildFiltered()  
       
        ]
    );
  }
}