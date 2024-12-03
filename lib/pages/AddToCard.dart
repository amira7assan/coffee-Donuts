import 'package:flutter/material.dart';
import 'package:mobile_project/models/Cart2.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/models/cart_iteam.dart';
import 'package:mobile_project/models/Cart2.dart';

class AddToCard extends StatefulWidget {
  final Cart cart;
  const AddToCard({Key? key, required this.cart}) : super(key: key);

  @override
  _AddToCardState createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {

  void _increaseQuantity(CartItem cartItem) {
    setState(() {
      cartItem.quantity++;
    });
  }

  // Method to decrease quantity by 1 or remove item if quantity is 1
  void _decreaseQuantity(CartItem cartItem) {
    setState(() {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
      } else {
        _showConfirmationDialog(cartItem); // Show confirmation dialog before removal
      }
    });
  }

  // Show a confirmation dialog to the user
  void _showConfirmationDialog(CartItem cartItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to remove this item from the cart?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  cartItem.quantity = 1; // Reset quantity to 1 if canceled
                });
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  widget.cart.items.remove(cartItem); // Remove the item from cart
                });
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: const Color(0xffDFA2A6),
      ),
      body: widget.cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (context, index) {
          final cartItem = widget.cart.items[index];
          return ListTile(
            leading: Image.asset(cartItem.product.image),
            title: Text(cartItem.product.title),
            subtitle: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    _decreaseQuantity(cartItem);
                  },
                ),
                Text(' ${cartItem.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    _increaseQuantity(cartItem);
                  },
                ),
              ],
            ),
            trailing: Text('\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
            onTap: () {},
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${widget.cart.totalPrice.toStringAsFixed(2)}'),
              ElevatedButton(
                onPressed: () {
                  // Checkout functionality
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
