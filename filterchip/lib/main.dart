import 'package:filterchip/model/product.dart';
import 'package:flutter/material.dart';

class FilterChipExample extends StatefulWidget {
  @override
  _FilterChipExampleState createState() => _FilterChipExampleState();
}

class _FilterChipExampleState extends State<FilterChipExample> {
  final List<String> categories = [
    'Fruits',
    'Vegetable',
    'Shoes',
    'Sports',
    'Garments'
  ];
  List<String> selectedCategories = [];
  String searchText = ''; // Store search text
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = productList.where(
      (product) {
        return (selectedCategories.isEmpty ||
                selectedCategories.contains(product.category)) &&
            (searchText.isEmpty ||
                product.name.toLowerCase().contains(searchText.toLowerCase()));
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Filters'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: categories.map((category) {
                return FilterChip(
                  label: Text(category),
                  selected: selectedCategories.contains(category),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedCategories.add(category);
                      } else {
                        selectedCategories.remove(category);
                      }
                    });
                  },
                );
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
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Products',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  elevation: 8.0,
                  margin: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      title: Text(product.name),
                      subtitle: Text(product.category),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 20),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FilterChipExample(),
  ));
}
