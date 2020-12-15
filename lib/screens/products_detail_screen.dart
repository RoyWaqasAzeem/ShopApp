// //import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/products.dart';

// class ProductsDetailsScreen extends StatelessWidget {
//   static const routeName = '/Product-detail';
//   // final String title;

//   // ProductsDetailsScreen(this.title);
//   @override
//   Widget build(BuildContext context) {
//     final productId = ModalRoute.of(context).settings.arguments as String;
//     final loadedProduct = Provider.of<Products>(
//       context,
//       listen: false,
//     ).findById(productId);
//     print(loadedProduct.title);
//     print(loadedProduct.price);
//     print(loadedProduct.description);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(loadedProduct.title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 300,
//               width: double.infinity,
//               child: Image.network(
//                 loadedProduct.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               '\$${loadedProduct.price}',
//               style: TextStyle(color: Colors.grey, fontSize: 20),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 width: double.infinity,
//                 child: Text(
//                   loadedProduct.description ?? "",
//                   textAlign: TextAlign.center,
//                   softWrap: true,
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10),
                Text(
                  '\$${loadedProduct.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
