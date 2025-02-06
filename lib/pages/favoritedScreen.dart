import 'package:flutter/material.dart';

class FavoritedScreen extends StatefulWidget {
  const FavoritedScreen({super.key});

  @override
  State<FavoritedScreen> createState() => _FavoritedScreenState();
}

class _FavoritedScreenState extends State<FavoritedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("favorited page"),
      ),
    );  }
}