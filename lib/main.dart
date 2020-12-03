// import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import './screens/products_detail_screen.dart';
import './screens/product_overview_screen.dart';
// import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductsDetailsScreen.routeName: (ctx) => ProductsDetailsScreen(),
      },
    );
  }
}
