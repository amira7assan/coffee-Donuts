import 'package:flutter/material.dart';
import 'package:mobile_project/models/Cart2.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/models/Cart2.dart';
class AddToCard extends StatelessWidget {
  final Cart cart;
  const AddToCard({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: const Color(0xffDFA2A6),
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = cart.items[index];
          return ListTile(
            leading: Image.asset(cartItem.product.image),  // Ensure the path is correct
            title: Text(cartItem.product.title),
            subtitle: Text('Quantity: ${cartItem.quantity}'),
            trailing: Text('\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
            onTap: () {
              // Add functionality to remove or edit quantities
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
