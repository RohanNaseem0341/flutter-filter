import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Screens/categories.dart';
import 'package:project/models/products.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Product> favoriteItems;

  const FavoriteScreen({Key? key, required this.favoriteItems})
      : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: widget.favoriteItems.length,
        itemBuilder: (context, index) {
          final product = widget.favoriteItems[index];
          return Card(
            elevation: 8.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.category),
              leading: SvgPicture.asset(
                'assets/images/Icon.svg',
              ),
              trailing: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onTap: () {
                // Handle tapping on a favorite item if needed.
              },
            ),
          );
        },
      ),
    );
  }
}
