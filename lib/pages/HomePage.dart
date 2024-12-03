import 'package:flutter/material.dart';
import 'package:mobile_project/pages/AddToCard.dart';
import 'package:mobile_project/widget/bottomNavigationBar.dart';
import 'package:mobile_project/models/cart_iteam.dart';
import '../models/product.dart';
import '../widget/ProductList.dart';
import 'package:mobile_project/models/Cart2.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final Cart _cart = Cart();

  // Method to handle adding an item to the cart
  void _addToCart(Product product) {
    setState(() {
      _cart.addItem(CartItem(product: product, quantity: 1));
    });
  }

  // Method to handle removing an item from the cart
  void _removeFromCart(CartItem cartItem) {
    setState(() {
      _cart.removeItem(cartItem);
    });
  }

  // Method to handle increasing the quantity of an item in the cart
  void _increaseQuantity(CartItem cartItem) {
    setState(() {
      _cart.addItem(cartItem);  // Increase the quantity by adding the same item again
    });
  }

  // Method to handle decreasing the quantity of an item in the cart
  void _decreaseQuantity(CartItem cartItem) {
    setState(() {
      _cart.removeItem(cartItem);  // Decrease the quantity by removing the item
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddToCard(cart: _cart)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDFA2A6),
        title: const Text('Coffee', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToCard(cart: _cart)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductList(
          products: testProduct,  // Assuming `testProduct` is your list of products
          onAddToCart: _addToCart,
          onRemoveFromCart: _removeFromCart,
          onIncreaseQuantity: _increaseQuantity,
          onDecreaseQuantity: _decreaseQuantity,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
