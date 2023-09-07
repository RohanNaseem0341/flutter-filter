import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Screens/categories.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final product = widget.cartItems[index];
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.category),
              leading: SvgPicture.asset(
                'assets/images/Icon.svg',
              ),
              trailing: Text('Quantity: ${product.quantity}'),
            ),
          );
        },
      ),
    );
  }
}
