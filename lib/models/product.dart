class Product {
  final String id;
  final String category;
  final String title;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.price,
    required this.image,
  });
}

List<Product> myData = [
  Product(
    id: '1',
    category: 'Coffee',
    title: 'Espresso',
    price: 4.99,
    image: 'assets/espresso.jpg',
  ),
  Product(
    id: '2',
    category: 'Coffee',
    title: 'Latte',
    price: 5.49,
    image: 'assets/latte.jpg',
  ),
  Product(
    id: '3',
    category: 'Tea',
    title: 'Green Tea',
    price: 3.99,
    image: 'assets/green_tea.jpg',
  ),
  Product(
    id: '4',
    category: 'Dessert',
    title: 'Chocolate Cake',
    price: 6.99,
    image: 'assets/chocolate_cake.jpg',
  ),
];
