import 'package:flutter/material.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final String title;

  ProductsDetailsScreen(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
