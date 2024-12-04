import 'package:flutter/material.dart';
import '../models/product.dart';

class AddToCartIcon extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const AddToCartIcon({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add_shopping_cart),
      onPressed: onAddToCart,
    );
  }
}
