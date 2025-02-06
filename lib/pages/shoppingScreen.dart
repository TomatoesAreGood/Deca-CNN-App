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
        buildTitle("Best Selling"),
        buildTitle("On Sale"),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
 
      ],
    );
  }
}