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
    return const ListTile(
      
    );
  }
}