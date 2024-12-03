class Product {
  final String category;
  final String title;
  final double price;
  final String image;

  Product({
    required this.category,
    required this.title,
    required this.price,
    required this.image,
  });
}

List<Product> testProduct = [
  Product(
    category: 'Coffee',
    title: 'Espresso',
    price: 4.99,
    image: 'assets/espresso.jpg',
  ),
  Product(
    category: 'Coffee',
    title: 'Latte',
    price: 5.49,
    image: 'assets/latte.jpg',
  ),
  Product(
    category: 'Tea',
    title: 'Green Tea',
    price: 3.99,
    image: 'assets/green_tea.jpg',
  ),
  Product(
    category: 'Dessert',
    title: 'Chocolate Cake',
    price: 6.99,
    image: 'assets/chocolate_cake.jpg',
  ),
];
