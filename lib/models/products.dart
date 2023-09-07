class product {
  final String name;
  final String category;
  final String picture;
  product({required this.name, required this.category, required this.picture});
}

final List<product> productList = [
  product(
      name: 'Apple',
      category: 'Fruits',
      picture: 'assets/images/Image Icon.svg'),
  product(
      name: 'Ball',
      category: 'Sports',
      picture: 'assets/images/Image Icon.svg'),
  product(
      name: 'Loafers',
      category: 'Shoes',
      picture: 'assets/images/Image Icon.svg'),
  product(
      name: 'Kurta',
      category: 'Garments',
      picture: 'assets/images/Image Icon.svg'),
  product(
      name: 'Onion',
      category: 'Vegetable',
      picture: 'assets/images/Image Icon.svg'),
  product(
      name: 'Potato',
      category: 'Vegetable',
      picture: 'assets/images/Image Icon.svg')
];
