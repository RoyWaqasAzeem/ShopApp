// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../widgets/app_drawer.dart';
// import '../providers/orders.dart' show Orders;
// import '../widgets/order_item.dart';

// class OrderScreen extends StatefulWidget {
//   static const routeName = '/orders';

//   @override
//   _OrderScreenState createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   var _isLoading = false;
//   @override
//   void initState() {
//     //Future.delayed(Duration.zero).then((_) async {
//     // setState(() {
//     //   _isLoading = true;
//     // });
//     //
//     // });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dataOrders = Provider.of<Orders>(context);

//     print(dataOrders.orders.length);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Orders'),
//       ),
//       drawer: AppDrawer(),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: dataOrders.orders.length,
//               itemBuilder: (ctx, i) => OrderItem(dataOrders.orders[i]),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
