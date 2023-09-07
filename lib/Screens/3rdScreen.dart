import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/Screens/cart.dart';
import 'package:project/Screens/categories.dart';
import 'package:project/Screens/favourite.dart';
import 'package:project/models/products.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  String searchText = ''; // Store search text
  TextEditingController searchController = TextEditingController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onDestinationSelected(int index) {
    if (index == 1) {
      // Navigate to the "Categories" screen when the "Categories" tab is selected.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CategoryScreen(), // Replace with your "Categories" screen.
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoriteScreen(
              favoriteItems: []), // Replace with your "Categories" screen.
        ),
      );
    } else {
      setState(() {
        currentPageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = productList.where(
      (product) {
        return (searchText.isEmpty ||
            product.category.toLowerCase().contains(searchText.toLowerCase()));
      },
    ).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onDestinationSelected,
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          NavigationDestination(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: isPortrait ? screenHeight * 0.25 : screenHeight * 0.35,
              decoration: BoxDecoration(color: Colors.indigo),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Hey, Halal',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(
                                cartItems: [],
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.shopping_cart_checkout_rounded),
                        label: Text('Cart'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      style: TextStyle(),
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Search Products or store',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27, left: 10),
                    child: Text(
                      'Delivery to',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, left: 10),
                        child: SvgPicture.asset('assets/images/Frame.svg'),
                      ),
                      SvgPicture.asset('assets/images/Group.svg'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: isPortrait ? 30 : 10),
              child: Container(
                width: screenWidth,
                height: isPortrait ? screenHeight * 0.2 : screenHeight * 0.35,
                child: CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/images/Card.svg',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/images/Banner.svg"),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/images/B3card.svg"),
                    ),
                  ],
                  options: CarouselOptions(
                    height:
                        isPortrait ? screenHeight * 0.4 : screenHeight * 0.7,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.04,
                child: Text(
                  'Recommended',
                  style: TextStyle(fontSize: isPortrait ? 20 : 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: isPortrait ? screenHeight * 0.6 : screenHeight * 0.9,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isPortrait ? 2 : 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Card(
                      elevation: 8.0,
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryScreen()));
                          },
                          child: GridTile(
                            footer: GridTileBar(
                              title: Text(product.category),
                              backgroundColor: Colors.black.withOpacity(0.5),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/Icon.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
