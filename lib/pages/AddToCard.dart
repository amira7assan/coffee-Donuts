import 'package:flutter/material.dart';
import 'package:mobile_project/models/Cart.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/pages/AddToCard.dart';
class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the cart items
    List<Product> cartItems = Cart.getCartItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: const Color(0xffDFA2A6),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            leading: Image.asset(product.image),
            title: Text(product.title),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
