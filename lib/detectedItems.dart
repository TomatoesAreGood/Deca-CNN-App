import 'package:deca_app_yolo/productDescriptions.dart';
import 'package:flutter/material.dart';

class DetectedItems extends StatefulWidget {
  final List<int> data;

  const DetectedItems({super.key, required this.data});

  @override
  State<DetectedItems> createState() => _DetectedItemsState();
}

class _DetectedItemsState extends State<DetectedItems> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
     return Align(
        alignment: Alignment.bottomCenter,
        child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.1,
          maxChildSize: 0.5,
          builder: (_, ScrollController scrollController) => Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.keyboard_arrow_up, size: 45, color: Colors.orange),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: widget.data.map((item)=> ListTile(title: Text(ProductDescriptions.productIDs[item] ?? "product ID not added: $item"))).toList()
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );         
  }
}