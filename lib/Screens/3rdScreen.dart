import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/models/products.dart';
import 'package:carousel_slider/carousel_slider.dart';

class screen3 extends StatefulWidget {
  const screen3({super.key});

  @override
  State<screen3> createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  String searchText = ''; // Store search text
  TextEditingController searchController = TextEditingController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = productList.where(
      (product) {
        return (searchText.isEmpty ||
            product.name.toLowerCase().contains(searchText.toLowerCase()));
      },
    ).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
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
        body: Column(children: [
          Container(
            width: screenWidth * 1,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Hey, Halal',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset('assets/images/Cart.svg'),
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
                          horizontal: 20.0), // Adjust the content padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      filled: true,
                      fillColor: Colors.blue,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 27, left: 10),
                    child: Text(
                      'Delivery to',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, left: 10),
                          child: SvgPicture.asset('assets/images/Frame.svg'),
                        )),
                    SvgPicture.asset('assets/images/Group.svg')
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
                width: screenWidth * 1,
                height: screenHeight * 0.2,
                child: CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
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
                    height: 380.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Container(
                  height: screenHeight * 0.04,
                  child: Text(
                    'Recommended',
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              // width: screenWidth * 1,
              height: screenHeight * 0.08,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Card(
                    elevation: 8.0,
                    margin: EdgeInsets.all(8.0),
                    child: Container(
                      // decoration: BoxDecoration(color: Colors.indigo),
                      child: GridTile(
                        footer: GridTileBar(
                          title: Text(product.category),
                          backgroundColor: Colors.black.withOpacity(0.5),
                        ),
                        child: SvgPicture.asset('assets/images/Icon.svg',
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]));
  }
}
