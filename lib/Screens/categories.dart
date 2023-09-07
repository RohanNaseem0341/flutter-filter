import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Screens/favourite.dart';

class Product {
  final String name;
  final String category;
  final String picture;
  bool isFavorite;

  Product({
    required this.name,
    required this.category,
    required this.picture,
    this.isFavorite = false,
    required int quantity, // Default isFavorite to false
  });

  get quantity => null;
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> categories = [
    'Fruits',
    'Vegetable',
    'Shoes',
    'Sports',
    'Garments'
  ];

  get cartItems => null;
  void addToCart(Product product) {
    setState(() {
      final existingProductIndex =
          cartItems.indexWhere((item) => item.name == product.name);

      if (existingProductIndex != -1) {
        // If the product is already in the cart, increase its quantity
        cartItems[existingProductIndex].quantity++;
      } else {
        // If the product is not in the cart, add it with a quantity of 1
        cartItems.add(Product(
          name: product.name,
          category: product.category,
          picture: product.picture,
          quantity: 1,
        ));
      }
    });
  }

  List<String> selectedCategories = [];
  String searchText = ''; // Store search text
  TextEditingController searchController = TextEditingController();
  List<Product> productList = []; // List of products
  List favoriteItems = [];
  @override
  void initState() {
    super.initState();
    productList = [
      Product(
          name: 'Apple',
          category: 'Fruits',
          picture: 'assets/images/Image Icon.svg',
          quantity: 2),
      Product(
          name: 'Ball',
          category: 'Sports',
          picture: 'assets/images/Image Icon.svg',
          quantity: 3),
      Product(
          name: 'Loafers',
          category: 'Shoes',
          picture: 'assets/images/Image Icon.svg',
          quantity: 4),
      Product(
          name: 'Kurta',
          category: 'Garments',
          picture: 'assets/images/Image Icon.svg',
          quantity: 5),
      Product(
          name: 'Onion',
          category: 'Vegetable',
          picture: 'assets/images/Image Icon.svg',
          quantity: 6),
      Product(
          name: 'Potato',
          category: 'Vegetable',
          picture: 'assets/images/Image Icon.svg',
          quantity: 7),
      Product(
          name: 'Sherwani',
          category: 'Garments',
          picture: 'assets/images/Image Icon.svg',
          quantity: 8),
      Product(
          name: 'Shirts',
          category: 'Garments',
          picture: 'assets/images/Image Icon.svg',
          quantity: 9),
      Product(
          name: 'Trousers',
          category: 'Garments',
          picture: 'assets/images/Image Icon.svg',
          quantity: 10),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Filter products based on selected categories and search text
    final filteredProducts = productList.where((product) {
      return (selectedCategories.isEmpty ||
              selectedCategories.contains(product.category)) &&
          (searchText.isEmpty ||
              product.name.toLowerCase().contains(searchText.toLowerCase()));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: categories.map((category) {
                return Expanded(
                    child: FilterChip(
                        label: Text(category),
                        selected: selectedCategories.contains(category),
                        onSelected: (selected) {
                          setState(
                            () {
                              if (selected) {
                                selectedCategories.add(category);
                              } else {
                                selectedCategories.remove(category);
                              }
                              // Filter products based on selected categories
                            },
                          );
                        }));
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value;
                  // Filter products based on search text
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Products',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              bool isSaved = favoriteItems.contains(product);
              return Card(
                elevation: 8.0,
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.category),
                  leading: SvgPicture.asset(
                    'assets/images/Icon.svg',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          isSaved ? Icons.favorite : Icons.favorite_border,
                          color: isSaved ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isSaved) {
                              favoriteItems.remove(product);
                            } else {
                              favoriteItems.add(product);
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          addToCart(product); // Add the product to the cart
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
