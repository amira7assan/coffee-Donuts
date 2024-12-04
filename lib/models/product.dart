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
    id: '4',
    category: 'Dessert',
    title: 'donuts with coconut ',
    price: 6.99,
    image: 'assets/chocolate_cake.jpg',
  ),
  Product(
    id: '2',
    category: 'Coffee',
    title: 'Latte',
    price: 5.49,
    image: 'assets/latte.jpg',
  ),
  Product(
    id: '6',
    category: 'mix',
    title: 'donuts & latte',
    price: 16,
    image: 'assets/mix1.jpg',
  ),
  Product(
    id: '3',
    category: 'Tea',
    title: 'Green Tea',
    price: 3.99,
    image: 'assets/green_tea.jpg',
  ),
   Product(
    id: '5',
    category: 'Dessert',
    title: 'donuts with almond',
    price: 13,
    image: 'assets/cofee&dount.jpg',
  ),
];
