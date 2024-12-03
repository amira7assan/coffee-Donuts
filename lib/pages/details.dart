import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/widget/bottomNavigationBar.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedIndex = 0;
  bool isFavorite = false;

  // Handle item tap event for bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Add product to favorites
  void onAddToFavorites(Product product) {
    setState(() {
      isFavorite = !isFavorite;
    });
    // Here you can add functionality to update the favorite status, e.g., saving to a database or a list
    // For example: favorites.add(product);
  }

  // Add product to shopping cart
  void onAddToCart(Product product) {
    // Implement your cart functionality here
    // For example: cart.add(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.title} added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        backgroundColor: const Color(0xffDFA2A6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.product.image, height: 250, width: 250),
            SizedBox(height: 16),
            Text(
              widget.product.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.product.category,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${widget.product.price}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => onAddToFavorites(widget.product),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () => onAddToCart(widget.product),
                ),
              ],
            ),
          ],
        ),
      ),
      /*bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),*/
    );
  }
}
